import { Stream } from "types/service/audio";
import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import Stack from "types/widgets/stack";
import { getValueFromArrayRange } from "src/utils";
import { NerdFontLabel } from "src/components/NerdFontLabel";

type StreamType = 'microphone' | 'speaker';

const volume = await Service.import('audio');

const microphoneIcon = '󰍬';
const microphoneMutedIcon = '󰍭';

const speakerIcons = ['󰕿', '󰖀', '󰕾'];
const speakerMutedIcon = '󰝟';

const VolumeStreamSlider = (stream: Stream) => {
  return Widget.Box({
    vertical: true,
    vpack: 'center',
    spacing: 2,
    marginLeft: 8,
    children: [
      Widget.Label({
        css: 'font-size: 12px',
        label: stream.bind('description').as((o) => o ?? 'Unknown'),
      }),
      Widget.Slider({
        drawValue: false,
        hpack: 'fill',
        value: stream.bind('volume'),
        onChange: ({ value }) => stream.volume = value,
      }),
    ],
  });
}

const VolumeStream = (stream: Stream, type: StreamType) => {
  const reveal = Variable(false);

  return Widget.EventBox({
    onPrimaryClick: () => reveal.setValue(!reveal.value),

    child: Widget.Box({
      children: [
        NerdFontLabel({ css: 'font-size: 18px' }).hook(stream, (self) => {
          if (type === 'speaker') {
            self.label = stream.is_muted
              ? speakerMutedIcon
              : getValueFromArrayRange(speakerIcons, 0, 1, stream.volume);

            return;
          }

          self.label = stream.is_muted ? microphoneMutedIcon : microphoneIcon;
        }),

        Widget.Revealer({
          transition: 'slide_left',
          revealChild: reveal.bind(),
          child: VolumeStreamSlider(stream),
        }),
      ],
    }),
  });
}

const Volume = () => VolumeStream(volume.speaker, 'speaker');

export default Volume;

