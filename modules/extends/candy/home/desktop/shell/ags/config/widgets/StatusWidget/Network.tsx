import { getValueFromArrayRange } from '$/lib';
import { bind, Gtk, Variable } from 'astal';
import AstalNetwork from 'gi://AstalNetwork';

const network = AstalNetwork.get_default();

const UnavailableIcon = () => <icon icon="globe-simple-x-symbolic" />;

const WiredIcon = ({ wired }: { wired: AstalNetwork.Wired | null }) => {
  const toIconName = (internet: AstalNetwork.Internet): string => {
    switch (internet) {
      case AstalNetwork.Internet.CONNECTED:
        return 'wifi-symbolic';
      default:
        return 'wifi-x';
    }
  };

  return wired ? (
    <icon icon={bind(wired, 'internet').as(toIconName)} />
  ) : (
    <UnavailableIcon />
  );
};

const wifiStrengthLevelIcons = [
  'wifi-none-fill-symbolic',
  'wifi-low-fill-symbolic',
  'wifi-medium-fill-symbolic',
  'wifi-high-fill-symbolic',
];

const WifiIcon = ({ wifi }: { wifi: AstalNetwork.Wifi | null }) => {
  if (!wifi) {
    return <UnavailableIcon />;
  }

  const iconName = Variable.derive(
    [bind(wifi, 'internet'), bind(wifi, 'strength')],
    (internet: AstalNetwork.Internet, strength: number) => {
      return internet === AstalNetwork.Internet.CONNECTED
        ? getValueFromArrayRange(wifiStrengthLevelIcons, 0, 100, strength)
        : 'wifi-slash-symbolic';
    }
  );

  return <icon icon={iconName()} />;
};

const Network = () => {
  const toIcon = (primary: AstalNetwork.Primary) => {
    switch (primary) {
      case AstalNetwork.Primary.WIFI:
        return <WifiIcon wifi={network.wifi} />;
      case AstalNetwork.Primary.WIRED:
        return <WiredIcon wired={network.wired} />;
      case AstalNetwork.Primary.UNKNOWN:
        return <UnavailableIcon />;
    }
  };

  return (
    <box halign={Gtk.Align.CENTER}>{bind(network, 'primary').as(toIcon)}</box>
  );
};

export default Network;
