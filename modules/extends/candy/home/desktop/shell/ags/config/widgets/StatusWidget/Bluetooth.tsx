import { Gtk, Variable, bind } from 'astal';
import AstalBluetooth from 'gi://AstalBluetooth';

const bluetooth = AstalBluetooth.get_default();

const bluetoothIcon = 'bluetooth-simple-symbolic';
const bluetoothConnectedIcon = 'bluetooth-simple-connected-symbolic';
const bluetoothDisabledIcon = 'bluetooth-simple-slash-symbolic';

const Bluetooth = () => {
  const iconName = Variable.derive(
    [bind(bluetooth, 'isConnected'), bind(bluetooth, 'isPowered')],
    (isConnected: boolean, isPowered: boolean) => {
      return isConnected
        ? bluetoothConnectedIcon
        : isPowered
        ? bluetoothIcon
        : bluetoothDisabledIcon;
    }
  );

  return (
    <box halign={Gtk.Align.CENTER}>
      <icon icon={iconName()} />
    </box>
  );
};

export default Bluetooth;
