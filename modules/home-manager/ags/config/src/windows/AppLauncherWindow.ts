// TODO: implement this thing

import { NerdFontLabel } from "src/components/NerdFontLabel";
import { Application } from "types/service/applications";

export const windowName = 'ags-applauncher';

const applications = await Service.import('applications');

const AppLauncherWindow = () => {
  const entry = Widget.Box({
    className: 'card',
    css: 'padding: 8px',
    spacing: 8,
    children: [
      NerdFontLabel({ label: '', opacity: 0.5 }),

      Widget.Entry({
        hexpand: true,
        placeholderText: 'Programs',
      }),
    ],
  });

  const appItem = (app: Application) => Widget.Button({
    hexpand: true,
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Icon({
          icon: app.bind('icon_name').as((icon) => icon ?? '')
        }),
        Widget.Label().bind('label', app, 'name'),
      ],
    }),
  });

  const apps = Widget.Box({
    className: 'card',
    css: 'padding: 8px',
    spacing: 2,
    hexpand: true,
    child: Widget.Scrollable({
      hscroll: 'never',
      css: 'min-height: 300px',
      hexpand: true,
      child: Widget.Box({ spacing: 4, vertical: true }).bind(
        'children',
        applications,
        'list',
        (apps) => apps.map(appItem)) 
    }),
  });

  return Widget.Window({
    name: windowName,
    layer: 'overlay',
    keymode: 'exclusive',
    widthRequest: 300,
    setup: self => self.keybind("Escape", () => {
      App.closeWindow(windowName);
    }),
    child: Widget.Box({
      hexpand: true,
      vertical: true,
      spacing: 16,

      children: [
        entry,
        apps,
      ],
    }),
  });
};

export default AppLauncherWindow;

