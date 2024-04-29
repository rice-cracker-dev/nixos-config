const network = await Service.import('network');

const networkWiredIcon = 'network-wireless-symbolic';
const networkWifiIcon = 'network-wireless-symbolic';
const networkDisconnected = 'network-offline';

const internet = {
  connected: 'Connected',
  connecting: 'Connecting',
  disconnected: 'Disconnected',
}

const NetworkWiredWidget = () => {
  const icon = Widget.Icon().hook(network, (self) => {
    self.icon = network.wired.internet === 'connected'
      ? networkWiredIcon
      : networkDisconnected;
  });

  const status = Widget.Label().bind('label', network.wired, 'internet', (i) => internet[i]);

  return Widget.Box({
    spacing: 8,
    children: [icon, status],
  });
};

const NetworkWifiWidget = () => {
  const icon = Widget.Icon().hook(network, (self) => {
    self.icon = network.wifi.internet === 'connected'
      ? networkWifiIcon
      : networkDisconnected;
  });

  const status = Widget.Label().bind('label', network.wifi, 'internet', (i) => internet[i]);

  return Widget.Box({
    spacing: 8,
    children: [icon, status],
  });
};

const NetworkNone = () => {
  const icon = Widget.Icon({ icon: networkDisconnected });
  const status = Widget.Label('No network');

  return Widget.Box({
    spacing: 8,
    children: [icon, status],
  });
};

const NetworkWidget = () => {
  return Widget.Box({
    className: 'card outline',
    child: Widget.Button({
      child: Widget.Stack({
        children: {
          wired: NetworkWiredWidget(),
          wifi: NetworkWifiWidget(),
          none: NetworkNone(),
        },

        transition: 'slide_left',
        hhomogeneous: false,
        shown: network.bind('primary').as((p) => p ?? 'none'),
      }),
    }),
  });
};

export default NetworkWidget;

