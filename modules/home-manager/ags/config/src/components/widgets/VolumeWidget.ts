import { getValueFromArrayRange } from "src/utils";

const audio = await Service.import('audio');

const volumeIcons = [
  'audio-volume-low-symbolic',
  'audio-volume-medium-symbolic',
  'audio-volume-high-symbolic'
];
const volumeMutedIcon = 'audio-volume-muted-symbolic'

const VolumeWidget = () => {
  return Widget.Box({
    className: 'card outline',
    child: Widget.Button({
      onClicked: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
      child: Widget.Box({
        spacing: 8,
        children: [
          Widget.Icon().hook(audio.speaker, (self) => {
            if (audio.speaker.is_muted || audio.speaker.stream?.is_muted) {
              self.icon = volumeMutedIcon;
              return;
            }

            self.icon = getValueFromArrayRange(
              volumeIcons,
              0,
              1,
              audio.speaker.volume
            );
          }),


          Widget.Label({ css: 'padding-right: 4px' })
          .bind('label', audio.speaker, 'volume', (v) => `${Math.trunc(v * 100)}%`)
        ],
      }),
    })
  });
};

export default VolumeWidget;
