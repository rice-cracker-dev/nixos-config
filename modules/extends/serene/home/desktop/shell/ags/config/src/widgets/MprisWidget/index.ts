import NerdFontLabel from "src/components/NerdFontLabel/index";
import type Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import type Box from "types/widgets/box";
import CavaWidget from "../CavaWidget/index";

const mpris = await Service.import('mpris');

export const supportedIcons: { [s: string]: string; } = {
  spotify: '',
};

const MprisWidget = () => {
  let previousBusName = '';

  const onPlayerChanged = (self: Box<Gtk.Widget, unknown>) => {
    const player = mpris.players.find((o) => o.name === 'spotify') ?? mpris.players[0];

    if (!player) {
      self.visible = false;
      return;
    }

    if (player.bus_name == previousBusName) {
      return;
    }

    previousBusName = player.bus_name;

    self.children = [
      CavaWidget({ barWidth: 4, barHeight: 16, spacing: 2 }),
      NerdFontLabel({ label: supportedIcons[player.name] })
    ];
  };

  return Widget.Box({
    class_name: 'card card-wide',
    spacing: 4,
    setup: (self) => {
      onPlayerChanged(self);

      self.hook(mpris, onPlayerChanged, 'player-added');
      self.hook(mpris, onPlayerChanged, 'player-closed');
    },
  });
};

export default MprisWidget;

