import { NerdFontLabel } from "src/components/NerdFontLabel";
import { getValueFromArrayRange } from "src/utils";
import { LabelProps } from "types/widgets/label";

const network = await Service.import('network');

const networkDisconnected = '󰤭';
const networkConnected = '󰤨';
const networkStrengths = ['󰤯', '󰤟', '󰤢', '󰤥', '󰤨'];

const networkStatus = {
  disconnected: 'Disconnected',
  connecting: 'Connecting',
  connected: 'Connected',
};

const WiredIndicator = () => {
  return NerdFontLabel({
    label: network.wired
      .bind('internet')
      .transform((o) => o === 'connected'
        ? networkConnected
        : networkDisconnected),
  });
};

const WifiIndicator = () => {
  return NerdFontLabel().hook(network, (self) => {
    if (network.wifi.internet !== 'connected') {
      self.label = networkDisconnected;
      return;
    }

    self.label = getValueFromArrayRange(networkStrengths, 0, 100, network.wifi.strength);
  });
};

const WiredStatus = () => {
  return Widget.Label({
    label: network.wired
      .bind('internet')
      .transform((o) => networkStatus[o]),
  });
};

const WifiStatus = () => {
  return Widget.Label().hook(network, (self) => {
    if (network.wifi.internet === 'connected' && network.wifi.ssid) {
      self.label = network.wifi.ssid;
      return;
    }

    self.label = networkStatus[network.wifi.internet];
  });
};

const Network = () => {
  const reveal = Variable(false);

  return Widget.EventBox({
    onPrimaryClick: () => reveal.setValue(!reveal.value),
    child: Widget.Box({
      children: [
        Widget.Stack({
          shown: network.bind('primary').transform((o) => o === null ? 'disconnected' : o),
          children: {
            wifi: WifiIndicator(),
            wired: WiredIndicator(),
            disconnected: Widget.Label({ label: networkDisconnected }),
          },
        }),

        Widget.Revealer({
          revealChild: reveal.bind(),
          transition: 'slide_left',
          child: Widget.Stack({
            shown: network.bind('primary').transform((o) => o === null ? 'disconnected' : o),
            marginLeft: 8,
            hhomogeneous: false,
            children: {
              wired: WiredStatus(),
              wifi: WifiStatus(),
              disconnected: Widget.Label({
                label: 'Missing adapter.',
              }),
            },
          }),
        }),
      ],
    }),
  });
};

export default Network;
