#!/usr/bin/env bash

reload() {
	pkill -15 quickshell
	quickshell -p ./ &
}

reload

while inotifywait -e close_write -r .; do
	reload
done
