import { MprisPlayer } from "types/service/mpris";
import { NerdFontLabel } from "../NerdFontLabel";
import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import MprisPopover from "./popovers/MprisPopover";

const mpris = await Service.import('mpris');

export const supportedName: { [s: string]: { icon: string; color: string } } = {
  spotify: { icon: '', color: '#1ED760' },
};


const MprisInstanceWidget = (player: MprisPlayer) => {
  const mprisPopover = MprisPopover();
  
  return Widget.Button({
    onClicked: (self) => {
      mprisPopover.set_relative_to(self);
      mprisPopover.set_position(3);
      // mprisPopover.popup();
    },

    child: Widget.Box({
      spacing: 8,
      children: [
        NerdFontLabel({ vpack: 'center' }).hook(player, (self) => {
          const supported = supportedName[player.name];
          self.visible = !!supported;

          if (supported) {
            self.css = `font-size: 16px; color: ${supported.color}`;
            self.label = supported.icon;
          }
        }),

        Widget.Box({
          vertical: true,
          vpack: 'center',
          children: [
            Widget.Label({ css: 'font-weight: 700' }).bind('label', player, 'track_title'),
          ],
        }),
      ],
    }),
  });
};

const MprisWidget = () => Widget.Box({ className: 'card' })
  .hook(mpris, (self) => {
    // prioritize spotify
    const player = mpris.players.find((o) => o.name === 'spotify') ?? mpris.players[0];

    if (!player) {
      self.visible = false;
      return;
    }

    self.child = MprisInstanceWidget(player);
  });

export default MprisWidget;
