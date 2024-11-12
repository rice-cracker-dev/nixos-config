import { bind } from 'astal';
import { QuickSettingsButton, QuickSettingsButtonProps } from '..';
import AstalNetwork from 'gi://AstalNetwork';

const network = AstalNetwork.get_default();

const internetToLabel = (internet: AstalNetwork.Internet) => {
  switch (internet) {
    case AstalNetwork.Internet.CONNECTED:
      return 'Connected';
    case AstalNetwork.Internet.CONNECTING:
      return 'Connecting';
    case AstalNetwork.Internet.DISCONNECTED:
      return 'Disconnected';
  }
};

const defaultProps = (
  device?: AstalNetwork.Wifi | AstalNetwork.Wired,
): QuickSettingsButtonProps => {
  const enabledClassName = 'btn-primary';
  const disabledClassName = 'btn-surface-100';

  return {
    name: 'network',
    className: device
      ? bind(device, 'internet').as(
          (internet) =>
            `btn ${
              internet === AstalNetwork.Internet.CONNECTED
                ? enabledClassName
                : disabledClassName
            }`,
        )
      : `btn ${disabledClassName}`,
  };
};

const Unavailable = () => {
  return (
    <QuickSettingsButton
      {...defaultProps()}
      icon="wifi-high-fill-symbolic"
      header="Disabled"
    />
  );
};

const Wifi = (wifi: AstalNetwork.Wifi) => {
  return (
    <QuickSettingsButton
      {...defaultProps(wifi)}
      icon="wifi-high-fill-symbolic"
      header={bind(wifi, 'internet').as(internetToLabel)}
      subheader={bind(wifi, 'ssid')}
    />
  );
};

const Network = () => {
  return bind(network, 'primary').as((primary) => {
    switch (primary) {
      case AstalNetwork.Primary.WIFI:
        return Wifi(network.wifi);
      case AstalNetwork.Primary.UNKNOWN:
        return Unavailable();
    }
  });
};

export default Network;
