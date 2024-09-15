import { Variable } from 'astal';
import { getValueFromArrayRange } from '$/lib';
import AstalWp from 'gi://AstalWp';
import AstalNetwork from 'gi://AstalNetwork';
import Gtk from 'gi://Gtk';

const network = AstalNetwork.get_default()

const audio = AstalWp.get_default_wp()?.audio;

const volumeIcons = [
  'speaker-simple-none-symbolic',
  'speaker-simple-low-symbolic',
  'speaker-simple-high-symbolic',
];

const volumeMutedIcon = 'speaker-simple-slash-symbolic';

const Volume = () => {
  const defaultSpeaker = audio?.get_default_speaker();

  if (!defaultSpeaker) {
    return null;
  }

  const volume = Variable<number | null>(defaultSpeaker.get_volume());
  const open = Variable(false);

  defaultSpeaker.connect('notify', (endpoint) =>
    volume.set(endpoint.mute ? null : endpoint.volume)
  );

  return (
    <button className="btn btn-ghost" onClick={() => open.set(!open.get())}>
      <box>
        <icon
          icon={volume().as((v) =>
            v ? getValueFromArrayRange(volumeIcons, 0, 1, v) : volumeMutedIcon
          )}
          valign={Gtk.Align.CENTER}
        />
        <revealer
          revealChild={open()}
          transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
        >
          <label
            marginLeft={8}
            label={volume().as((o) =>
              o ? `${(o * 100).toFixed()}%` : 'Muted'
            )}
          />
        </revealer>
      </box>
    </button>
  );
};

export default Volume;
