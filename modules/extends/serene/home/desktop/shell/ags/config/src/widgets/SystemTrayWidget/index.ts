import type { TrayItem } from "types/service/systemtray";

const systemTray = await Service.import('systemtray');

const TrayItemWidget = (item: TrayItem) => {
  return Widget.Button({
    on_primary_click: (_, event) => item.activate(event),
    on_secondary_click: (_, event) => item.openMenu(event),

    child: Widget.Icon({
      size: 14,
      icon: item.bind('icon'),
    }),
  });
}

const SystemTrayWidget = () => {
  return Widget.Box({
    vpack: 'center',
    children: systemTray.bind('items').as((i) => i.map(TrayItemWidget)),
  });
};

export default SystemTrayWidget;
