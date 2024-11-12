import { bind } from 'astal';
import { Gtk } from 'astal/gtk3';
import { volumeIcons, volumeMutedIcon } from '$/widgets/StatusWidget/Volume';
import WirePlumber from 'gi://AstalWp';
import { getValueFromArrayRange } from '$/lib';

const wp = WirePlumber.get_default();

const PipewireSlider = () => {
  const source = wp?.get_default_speaker();

  if (!source) {
    return null;
  }

  return (
    <box spacing={8}>
      <slider
        className="slider"
        value={bind(source, 'volume')}
        max={1}
        halign={Gtk.Align.FILL}
        hexpand
        onDragged={(self) => (source.volume = self.value)}
      />
      <button
        onClicked={() => (source.mute = !source.mute)}
        className={bind(source, 'mute').as(
          (mute) =>
            `btn btn-square ${mute ? 'btn-surface-100' : 'btn-primary'}`,
        )}
      >
        <icon
          setup={(self) => {
            self.hook(source, 'notify', () => {
              self.icon = source.mute
                ? volumeMutedIcon
                : getValueFromArrayRange(volumeIcons, 0, 1, source.volume);
            });
          }}
        />
      </button>
    </box>
  );
};

export default PipewireSlider;
