import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import Box from "types/widgets/box";
import { MprisPlayerWidget } from "./popovers/MprisPopover";
import DashboardQuotesWidget from "./DashboardQuotesWidget";

const mpris = await Service.import('mpris');

const DashboardDynamicWidget = () => {
  const hookCallback = (self: Box<Gtk.Widget, unknown>) => {
    const player = mpris.players[0];

    if (player) {
      self.child = MprisPlayerWidget(player, {
        large: true,
        applyMprisStyle: false,
        showCavaWidget: true,
        cavaMargin: 4,
      });
      return;
    };

    self.child = DashboardQuotesWidget();
  };

  return Widget.Box({ css: 'min-width: 450px', hpack: 'center' })
    .hook(mpris, hookCallback, 'player-closed')
    .hook(mpris, hookCallback, 'player-added');
};

export default DashboardDynamicWidget;
