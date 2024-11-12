import { Gtk, Widget } from 'astal/gtk3';
import Volume from './Volume';
import Network from './Network';
import Bluetooth from './Bluetooth';

const StatusWidget = (props: Omit<Widget.BoxProps, 'child' | 'children'>) => {
  return (
    <box
      {...props}
      orientation={Gtk.Orientation.VERTICAL}
      spacing={16}
      css="margin: 4px 0"
    >
      <Bluetooth />
      <Volume />
      <Network />
    </box>
  );
};

export default StatusWidget;
