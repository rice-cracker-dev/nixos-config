import { bind } from 'astal';
import { Gtk } from 'astal/gtk3';
import Brightness from '$/services/BrightnessService';

const brightness = Brightness.get_default();

const BrightnessSlider = () => {
  return (
    <box spacing={8}>
      <slider
        className="slider"
        value={bind(brightness, 'screen')}
        max={1}
        halign={Gtk.Align.FILL}
        hexpand
        onDragged={(value) => (brightness.screen = value.value)}
      />
      <button className="btn btn-square btn-surface-100">
        <icon icon="sun-symbolic" />
      </button>
    </box>
  );
};

export default BrightnessSlider;
