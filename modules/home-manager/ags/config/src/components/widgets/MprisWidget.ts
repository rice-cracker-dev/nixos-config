import { MprisPlayer } from "types/service/mpris";
import { NerdFontLabel } from "../NerdFontLabel";
import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import MprisPopover from "./popovers/MprisPopover";

const mpris = await Service.import('mpris');

export const supportedName: { [s: string]: { icon: string; } } = {
  spotify: { icon: '' },
};

const MprisWidget = () => Widget.Box({ className: 'card' })
  .hook(mpris, (self) => {
    // prioritize spotify
    const player = mpris.players.find((o) => o.name === 'spotify') ?? mpris.players[0];

    if (!player) {
      self.visible = false;
      return;
    }

    self.class_name = `card mpris-${player.name}`
    self.child = Widget.Button({

      child: Widget.Box({
        spacing: 8,
        children: [
          NerdFontLabel({ vpack: 'center' }).hook(player, (self) => {
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
              Widget.Label({ css: 'font-weight: 700' }).bind('label', player, 'track_title'),
            ],
          }),
        ],
      }),
    });
  });

export default MprisWidget;
