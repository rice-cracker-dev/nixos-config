import { bind, Variable } from 'astal'
import { QuickSettingsButton } from '..';
import AstalBluetooth from 'gi://AstalBluetooth';

const bluetooth = AstalBluetooth.get_default();

type StatusProps = [boolean, boolean, AstalBluetooth.Device[]];

const connectedToLabel = ([connected, powered]: StatusProps) =>
  powered ? (connected ? 'Connected' : 'Not connected') : 'Disabled';

const connectedToClassName = ([_, powered]: StatusProps) =>
  `btn ${powered ? 'btn-primary' : 'btn-surface-100'}`;

const connectedToIcon = ([connected, powered]: StatusProps) =>
  powered
    ? connected
      ? 'bluetooth-simple-connected-symbolic'
      : 'bluetooth-simple-symbolic'
    : 'bluetooth-simple-slash-symbolic';

const connectedToSubheader = ([connected, powered, devices]: StatusProps) =>
  powered
    ? connected
      ? devices.find((d) => d.connected)?.name ?? 'Unknown'
      : `${devices.length} devices available`
    : 'Bluetooth is turned off';

const Bluetooth = () => {
  const bluetoothStatuses = Variable.derive([
    bind(bluetooth, 'isConnected'),
    bind(bluetooth, 'isPowered'),
    bind(bluetooth, 'devices'),
  ]);

  return (
    <QuickSettingsButton
      name="bluetooth"
      className={bind(bluetoothStatuses).as(connectedToClassName)}
      icon={bind(bluetoothStatuses).as(connectedToIcon)}
      header={bind(bluetoothStatuses).as(connectedToLabel)}
      subheader={bind(bluetoothStatuses).as(connectedToSubheader)}
    />
  );
};

export default Bluetooth;
