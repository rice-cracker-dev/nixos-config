import { TrayItem } from "types/service/systemtray";

const systemTray = await Service.import('systemtray');

const SystemTrayWidgetItem = (item: TrayItem) => {
  return Widget.Button({
    className: 'icon',
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
    child: Widget.Icon().bind('icon', item, 'icon'),
  });
};

const SystemTrayWidget = (vertical = false) => Widget.Box({
  vertical,
  className: 'card outline',
  visible: systemTray.bind('items').as(i => i.length > 0),
  child: Widget.Box({ spacing: 4 }).bind(
    'children',
    systemTray,
    'items',
    (i) => i.map(SystemTrayWidgetItem)
  ),
});

export default SystemTrayWidget;
