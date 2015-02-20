
#!/bin/bash
#
# dzen_brightness.sh : OSD brightness utility
# modified from dvol.sh
# Sunday, 16 February 2014 19:01 IST
#


source $(dirname $0)/dzen_popup_config

#Customize this stuff
SECS="2"            # sleep $SECS
XPOS="1000"          # horizontal positioning
YPOS="30"          # vertical positioning
HEIGHT="30"         # window height
WIDTH="250"         # window width
BAR_WIDTH="150"     # width of bar
BAR_HEIGHT="2"     # height of bar
ICON='^i(/home/joe/.icons/brightness.xbm)'

#Probably do not customize
PIPE="/tmp/.dzen_brightness_pipe"

err() {
  echo "$1"
  exit 1
}

usage() {
  echo "usage: dvol [option]"
  echo
  echo "Options:"
  echo "     up - increase brightness "
  echo "     down - decrease brightness"
  echo "     -h, --help     - display this"
  exit
}

#Argument Parsing

CURR=$(< /sys/class/backlight/intel_backlight/brightness)
MAX=$(< /sys/class/backlight/intel_backlight/max_brightness)

case $1 in
    up)
        if [[ $CURR -lt $MAX ]]; then
            CURR=$((CURR+30))
            echo $CURR > /sys/class/backlight/intel_backlight/brightness
        fi
    ;;
    down)
        if [[ $CURR -gt 0 ]]; then
            CURR=$((CURR-30))
            echo $CURR > /sys/class/backlight/intel_backlight/brightness
        fi
    ;;
    ''|'-h'|'--help')
        usage
    ;;
    *)
        err "Unrecognized option \`$1', see --help"
    ;;
esac

PERC=$((CURR*100/MAX))

#Using named pipe to determine whether previous call still exists
#Also prevents multiple instances
if [ ! -e "$PIPE" ]; then
  mkfifo "$PIPE"
  (dzen2 -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -fn "$FONT" ${OPTIONS} < "$PIPE"
   rm -f "$PIPE") &
fi

BAR=$(echo "$PERC" | gdbar -fg "$bar_fg" -bg "$bar_bg" -w "$BAR_WIDTH" -h "$BAR_HEIGHT")

#Feed the pipe!
(echo "$ICON  $BAR  $CURR"; sleep "$SECS"  ) > "$PIPE"
