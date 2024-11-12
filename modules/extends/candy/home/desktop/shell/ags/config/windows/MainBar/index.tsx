import { App, Astal, Gtk, Widget } from 'astal/gtk3';
import { ClockWidget, StatusWidget } from '$/widgets';
import {
  toggleMenuType,
  SidebarMenuType,
  currentMenuType,
} from '$/windows/SideBar';
import HyprlandWidget from '$/widgets/HyprlandWidget';
import SystemTrayWidget from '$/widgets/SystemTrayWidget';
import { debug } from '..';

const MainBar = (monitor: number) => {
  const homeButtonOnClick: Widget.ButtonProps['onClick'] = (_, event) => {
    if (event.button === Astal.MouseButton.SECONDARY && debug) {
      App.inspector();
    }
  };

  const window = (
    <window
      className="mainbar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.BOTTOM |
        Astal.WindowAnchor.RIGHT
      }
      application={App}
    >
      <centerbox
        className="mainbar__main"
        halign={Gtk.Align.CENTER}
        orientation={Gtk.Orientation.VERTICAL}
      >
        <box halign={Gtk.Align.CENTER} valign={Gtk.Align.START}>
          <button
            className="btn btn-ghost btn-primary btn-square"
            onClick={homeButtonOnClick}
          >
            <icon icon="nixos-symbolic" halign={Gtk.Align.CENTER} />
          </button>
        </box>
        <box orientation={Gtk.Orientation.VERTICAL} halign={Gtk.Align.FILL}>
          <HyprlandWidget halign={Gtk.Align.FILL} />
        </box>
        <box
          halign={Gtk.Align.CENTER}
          valign={Gtk.Align.END}
          orientation={Gtk.Orientation.VERTICAL}
          spacing={16}
        >
          <SystemTrayWidget />
          <button
            className={currentMenuType(
              (type) =>
                `btn btn-square ${
                  type === SidebarMenuType.SYSTEM ? 'btn-primary' : 'btn-ghost'
                }`
            )}
            onClicked={() => toggleMenuType(SidebarMenuType.SYSTEM)}
          >
            <StatusWidget halign={Gtk.Align.CENTER} />
          </button>
          <button className="btn btn-square btn-ghost">
            <ClockWidget halign={Gtk.Align.CENTER} />
          </button>
        </box>
      </centerbox>
    </window>
  );

  return window;
};

export default MainBar;
