import { Notification } from "types/service/notifications";

export const windowName = 'ags-notification'

const notifications = await Service.import('notifications');

const NotificationImageWidget = (n: Notification) => {
  if (n.image) {
    return Widget.Box({
      className: 'img-notification',
      css: `background-image: url("${n.image}")`
    });
  }

  let icon = 'dialog-information-symbolic'
  if (Utils.lookUpIcon(n.app_icon)) {
    icon = n.app_icon;
  }

  if (n.app_entry && Utils.lookUpIcon(n.app_entry)) {
    icon = n.app_entry;
  }

  return Widget.Icon({ icon, size: 48 });
};

const NotificationWidget = (n: Notification) => {
  const content = Widget.Box({
    spacing: 8,
    visible: false,
    children: [
      NotificationImageWidget(n),

      Widget.Box({
        vertical: true,
        children: [
          Widget.Label({
            xalign: 0,
            justification: 'left',
            className: 'text-heading',
            wrap: true,
            useMarkup: true,
            label: n.summary,
          }),
          Widget.Label({
            xalign: 0,
            justification: 'left',
            className: 'text-body',
            wrap: true,
            useMarkup: true,
            max_width_chars: 24,
            truncate: 'end',
            label: n.body,
          }),
        ],
      })
    ],
  });

  const actions = n.actions.reverse();

  const buttons = Widget.Box({
    hpack: 'end',
    spacing: 8,
    visible: actions.length > 0,
    children: actions.map(({ id, label }, index) => Widget.Button({
      className: index >= actions.length - 1 ? 'active' : 'solid',
      child: Widget.Label(label),

      onClicked: () => {
        n.invoke(id);
        n.dismiss();
      },
    })),
  })

  return Widget.EventBox({
    attribute: { id: n.id },
    onPrimaryClick: n.dismiss,

    child: Widget.Box({
      hexpand: true,
      className: 'card outline',
      css: 'padding: 8px',
      vertical: true,
      spacing: 8,
      children: [content, buttons],
    }),
  });
};

const NotificationWindow = () => {
  const list = Widget.Box({
    css: 'padding: 8px',
    vertical: true,
    hexpand: true,
    spacing: 8,
    children: notifications.popups.map(NotificationWidget),
  });

  const onNotified = (_: any, id: number) => {
    const n = notifications.getNotification(id)
    if (n) {
      list.children = [NotificationWidget(n), ...list.children];
    }
  }

  const onDismissed = (_: any, id: number) => {
    list.children.find(n => n.attribute.id === id)?.destroy();
  }

  list.hook(notifications, onNotified, 'notified')
  .hook(notifications, onDismissed, 'dismissed');

  return Widget.Window({
    name: windowName,
    layer: 'overlay',
    anchor: ['top', 'right'],

    widthRequest: 300,

    child: list,
  });
};

export default NotificationWindow;
