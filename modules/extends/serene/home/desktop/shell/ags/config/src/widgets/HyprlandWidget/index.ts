import type { Client } from 'types/service/hyprland';

const hyprland = await Service.import('hyprland');
const applications = await Service.import('applications')

const tryQueryIconFromClient = (client: Client) => {
  return applications.query(client.class)?.at(0)?.icon_name
    ?? applications.query(client.initialTitle)?.at(0)?.icon_name;
};

const ClientWidget = (client: Client) => {
  const icon = tryQueryIconFromClient(client);

  return Widget.Button({
    width_request: 196,
    vexpand: true,
    css: 'min-width: 96px; max-width: 96px;',
    child: Widget.Box({
      vexpand: true,
      spacing: 4,
      children: [
        Widget.Icon({
          size: 16,
          icon: icon ?? 'dialog-information-symbolic',
          visible: !!icon,
          vpack: 'center',
        }),
        Widget.Label({
          label: client.title,
          truncate: 'end',
          max_width_chars: 30,
          vpack: 'center',
        }),
      ],
    }),

    on_primary_click: () => {
      hyprland.message(`dispatch focuswindow address:${client.address}`);
    },
  }).hook(hyprland.active.client, (self) => {
    const classes = ['btn'];

    if (hyprland.active.client.address === client.address) {
      classes.push('btn-active');
    }

    self.class_names = classes;
  });
};

const HyprlandWidget = () => {
  return Widget.Scrollable({
    hscroll: 'automatic',
    vscroll: 'never',
    hexpand: true,
    child: Widget.Box({
      vexpand: true,
      spacing: 2,
      children: hyprland.bind('clients').as((c) => c.map(ClientWidget)),
    }),
  });
};

export default HyprlandWidget;

