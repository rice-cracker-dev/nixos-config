#!/usr/bin/env bash

update() {
  default_sink=$(pactl get-default-sink)
  sink=$(pactl -f json list sinks | jq 'map(select(.name == $sink)) | first' --arg sink "$default_sink")
  
  echo "$sink"
}

update

pactl subscribe | update