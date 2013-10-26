#! /bin/bash

# MOTEEL
# Maintainer: @ferdous
# App Version: 4.0

### BEGIN INIT INFO
# Provides:          rubbama
# Required-Start:    $local_fs $remote_fs $network $syslog redis-server
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: rubbama
# Description:       rubbama
### END INIT INFO


APP_ROOT="/home/dev/public_html/www.rubbama.com/current"
DAEMON_OPTS="-c $APP_ROOT/config/unicorn.conf.rb -E production"
PID_PATH="$APP_ROOT/tmp/pids"
UNICORN_PID="$PID_PATH/unicorn.pid"
NAME="unicorn"
DESC="Raakib service"

check_pid(){
  if [ -f $UNICORN_PID ]; then
    PID=`cat $UNICORN_PID`
    STATUS=`ps aux | grep $PID | grep -v grep | wc -l`
  else
    STATUS=0
    PID=0
  fi
}

start() {
  cd $APP_ROOT
  check_pid
  if [ "$PID" -ne 0 -a "$STATUS" -ne 0 ]; then
    # Program is running, exit with error code 1.
    echo "Error! $DESC $NAME is currently running!"
    exit 1
  else
    if [ `whoami` = root ]; then
      sudo -u dev -H bash -l -c "nohup bundle exec unicorn_rails $DAEMON_OPTS  > /dev/null  2>&1 &"
      echo "$DESC started"
    fi
  fi
}

stop() {
  cd $APP_ROOT
  check_pid
  if [ "$PID" -ne 0 -a "$STATUS" -ne 0 ]; then
    ## Program is running, stop it.
    kill -QUIT `cat $UNICORN_PID`
    ##kill -QUIT `cat $RESQUE_PID`
    rm "$UNICORN_PID" >> /dev/null
    ##rm "$RESQUE_PID" >> /dev/null
    echo "$DESC stopped"
  else
    ## Program is not running, exit with error.
    echo "Error! $DESC not started!"
    exit 1
  fi
}

restart() {
  cd $APP_ROOT
  check_pid
  if [ "$PID" -ne 0 -a "$STATUS" -ne 0 ]; then
    echo -n "Restarting $DESC: "
    kill -USR2 `cat $UNICORN_PID`
    echo "$NAME."
  else
    echo "Error, $NAME not running!"
    exit 1
  fi
}

status() {
  cd $APP_ROOT
  check_pid
  if [ "$PID" -ne 0 -a "$STATUS" -ne 0 ]; then
    echo "$DESC with PID $PID is running."
  else
    echo "$DESC is not running."
    exit 1
  fi
}

## Check to see if we are running as root first.
## Found at http://www.cyberciti.biz/tips/shell-root-user-check-script.html
#if [ "$(id -u)" != "0" ]; then
#    echo "This script must be run as root"
#    exit 1
#fi

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        restart
        ;;
  reload|force-reload)
        echo -n "Reloading $DESC configuration: "
        kill -HUP `cat $PID`
        echo "$NAME."
        ;;
  status)
        status
        ;;
  *)
        echo "Usage: $NAME {start|stop|restart|reload}" >&2
        exit 1
        ;;
esac