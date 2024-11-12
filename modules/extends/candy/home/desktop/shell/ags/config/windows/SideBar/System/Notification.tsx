import { Card } from '$/components';
import { GLib } from 'astal';
import { Gtk, Widget } from 'astal/gtk3';
import AstalNotifd from 'gi://AstalNotifd';

const notifd = AstalNotifd.get_default();

const prepend = (box: Widget.Box, child: Gtk.Widget) => {
  box.set_children([child, ...box.get_children()]);
};

const NotificationItem = (id: number | AstalNotifd.Notification) => {
  const item = typeof id === 'number' ? notifd.get_notification(id) : id;
  const actions = item.get_actions() ?? [];

  return (
    <Card
      name={item.id.toString()}
      variant="surface-100"
      border={false}
      className="system__notification"
    >
      <box orientation={Gtk.Orientation.VERTICAL} spacing={2} hexpand>
        <box
          opacity={0.5}
          className="system__notification__summary"
          spacing={2}
        >
          <label
            label={`${item.appName} - ${item.summary}`}
            xalign={0}
            singleLineMode
            truncate
            hexpand
          />
          <button
            onClicked={() => item.dismiss()}
            className="btn btn-ghost system__notification_close-btn"
          >
            <icon icon="x-close-symbolic" />
          </button>
        </box>

        <label
          label={item.body}
          useMarkup={true}
          xalign={0}
          className="system__notification__body"
        />

        {actions.length > 0 && (
          <box halign={Gtk.Align.END} marginTop={8}>
            {actions.map((action) => (
              <button
                onClicked={() => item.invoke(action.id)}
                className="btn btn-soft system__notification__action-btn"
              >
                {action.label}
              </button>
            ))}
          </box>
        )}
      </box>
    </Card>
  );
};

const Notification = () => {
  let notifiedEventId: number | null = null;
  let dismissedEventId: number | null = null;

  const setup = (self: Widget.Box) => {
    self.set_children(notifd.get_notifications().map(NotificationItem));

    notifiedEventId = notifd.connect('notified', (_, id) => {
      prepend(self, NotificationItem(id));
      console.log(`${id} added`);
    });

    dismissedEventId = notifd.connect('resolved', (_, id) => {
      const widget = self.get_children().find((v) => v.name === id.toString());

      if (widget) {
        self.remove(widget);
        console.log(`${id} removed`);
      }
    });
  };

  const onDestroy = () => {
    if (notifiedEventId) {
      notifd.disconnect(notifiedEventId);
    }

    if (dismissedEventId) {
      notifd.disconnect(dismissedEventId);
    }
  };

  return (
    <scrollable
      hexpand
      vexpand
      hscroll={Gtk.PolicyType.NEVER}
      vscroll={Gtk.PolicyType.AUTOMATIC}
    >
      <box
        orientation={Gtk.Orientation.VERTICAL}
        spacing={12}
        setup={setup}
        onDestroy={onDestroy}
      />
    </scrollable>
  );
};

export default Notification;
