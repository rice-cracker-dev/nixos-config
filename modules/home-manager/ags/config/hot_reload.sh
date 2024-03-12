#!/usr/bin/env bash

reload() {
	pkill -15 ags
	ags -c ./config.js &
}

reload

while inotifywait -e close_write -r ./src --exclude ./src/styles/; do
	reload
done
