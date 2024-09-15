#!/usr/bin/env bash

export SHELL_DEBUG=all

reload() {
	pkill gjs
	ags -c . &
}

reload

while inotifywait -e close_write -r . --exclude '@girs'; do
	reload
done
