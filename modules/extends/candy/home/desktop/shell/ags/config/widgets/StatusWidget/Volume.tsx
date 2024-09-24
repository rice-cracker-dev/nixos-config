import { Variable, Gtk, bind } from 'astal';
import { getValueFromArrayRange } from '$/lib';
import AstalWp from 'gi://AstalWp';

const audio = AstalWp.get_default_wp()?.audio;

const volumeIcons = [
  'speaker-simple-none-fill-symbolic',
  'speaker-simple-low-fill-symbolic',
  'speaker-simple-high-fill-symbolic',
];

const volumeMutedIcon = 'speaker-simple-x-fill-symbolic';

const Volume = () => {
  const speaker = audio?.get_default_speaker();

  if (!speaker) {
    return null;
  }

  const volumeIcon = Variable.derive(
    [bind(speaker, 'volume'), bind(speaker, 'mute')],
    (volume, mute) =>
      mute ? volumeMutedIcon : getValueFromArrayRange(volumeIcons, 0, 1, volume)
  );

  return (
    <box halign={Gtk.Align.CENTER}>
      <icon icon={volumeIcon()} valign={Gtk.Align.CENTER} />
    </box>
  );
};

export default Volume;
