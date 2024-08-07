pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  property int barsMaxRange: 1000
  property int barsNumber: 128
  property variant barsData: []

  Process {
    id: "cavaProc"
    running: true
    command: [
      "bash",
      "-c",
      `printf "[general]\n \
      bars = ${barsNumber}\n \
      autosens = 1\n \
      sensitivity = 100\n \
      [output]\n \
      method = raw\n \
      raw_target = /dev/stdout\n \
      data_format = ascii\n \
      ascii_max_range = ${barsMaxRange}" |
	    cava -p /dev/stdin`
    ]
    stdout: SplitParser {
      onRead: data => (barsData = data.split(';').slice(0, barsNumber).map((o) => parseInt(o) / barsMaxRange))
    }
  }
}

