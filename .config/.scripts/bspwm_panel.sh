#! /bin/sh

source $(dirname $0)/panel_config

if [ $(pgrep -cx bspwm_panel.sh) -gt 1 ] ; then
    printf "%s\n" "The panel is already running." >&2
    exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

bspc control --subscribe > "$PANEL_FIFO" &

#clock -sf 'C%a %d-%b %H:%M' > "$PANEL_FIFO" &
xtitle -sf 'T%s' > "$PANEL_FIFO" &
#xprop -spy -root _NET_ACTIVE_WINDOW | sed -un 's/.*\(0x.*\)/A\1/p' > "$PANEL_FIFO" &
conky -c ~/.conky/bspwm_july_conkyrc > "$PANEL_FIFO" &

~/.scripts/bspwm_panel_bar_july.sh < "$PANEL_FIFO" \
     | bar -p \
           -g "$geometry" \
           -f "$FONT1"\
           -B "$BAR_BG" \
           -F "$BAR_FG" \
           | while read line; do eval "$line"; done &
wait

