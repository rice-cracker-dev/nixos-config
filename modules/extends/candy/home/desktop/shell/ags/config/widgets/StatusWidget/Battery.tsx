import { bind } from 'astal';
import AstalBattery from 'gi://AstalBattery';

const battery = AstalBattery.get_default();

const batteryChargingIcon = 'battery-charging-vertical-fill-symbolic';
const batteryLevelIcon = [
  'battery-vertical-empty-fill-symbolic',
  'battery-vertical-low-fill-symbolic',
  'battery-vertical-medium-fill-symbolic',
  'battery-vertical-high-fill-symbolic',
  'battery-vertical-full-fill-symbolic',
];

const Battery = () => {
  const toIcon = (perc: number) => {};

  return <label label={bind(battery, 'is_rechargable').as((p) => `${p}`)} />;
};

export default Battery;
