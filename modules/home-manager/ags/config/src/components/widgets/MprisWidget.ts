import Box from "types/widgets/box";
import { NerdFontLabel } from "../NerdFontLabel";
import Gtk from "types/@girs/gtk-3.0/gtk-3.0";

const mpris = await Service.import('mpris');

export const supportedName: { [s: string]: { icon: string; } } = {
  spotify: { icon: '' },
};

const MprisWidget = () => {
  let previousBusName = '';

  const onPlayerAddedRemoved = (self: Box<Gtk.Widget, unknown>) => {
    // prioritize spotify
    const player = mpris.players.find((o) => o.name === 'spotify') ?? mpris.players[0];

    if (!player) {
      self.visible = false;
      return;
    }

    if (previousBusName === player.bus_name) {
      print('same player, skipping...');
      return;
    }

    previousBusName = player.bus_name;

    self.class_name = `card outline mpris-${player.name}`
    self.child = Widget.Button({
      onClicked: player.playPause,

      child: Widget.Box({
        spacing: 8,
        children: [
          NerdFontLabel({
            vpack: 'center',
            css: 'font-size: 14px',
          }).hook(player, (self) => {
            const supported = supportedName[player.name];
            self.visible = !!supported;

            if (supported) {
              self.label = supported.icon;
            }
          }),

          Widget.Box({
            vertical: true,
            vpack: 'center',
            children: [
              Widget.Label({
                maxWidthChars: 24,
                css: 'font-weight: 700'
              }).bind('label', player, 'track_title'),
            ],
          }),
        ],
      }),
    });
  };

  return Widget.Box({
    setup: (self) => {
      onPlayerAddedRemoved(self);

      self.hook(mpris, onPlayerAddedRemoved, 'player-added');
      self.hook(mpris, onPlayerAddedRemoved, 'player-closed');
    },
  })
};

export default MprisWidget;
