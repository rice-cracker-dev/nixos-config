import { App, Astal, bind, Gdk, Gtk, Variable, Widget } from 'astal';
import { ClockWidget, StatusWidget } from '$/widgets';
import HyprlandWidget from '$/widgets/HyprlandWidget';
import PopupWindow, { PopupWindowPosition } from '../PopupWindow';
import SystemTrayWidget from '$/widgets/SystemTrayWidget';

const getWidgetOffsetY = (widget: Gtk.Widget): [number, Astal.WindowAnchor] => {
  const screenY = Gdk.Screen.height();

  const topLevel = widget.get_toplevel();
  const [, , destY] = widget.translate_coordinates(topLevel, 0, 0);
  const wHeight = widget.get_allocated_height();

  if (destY < screenY / 2) {
    return [destY, Astal.WindowAnchor.TOP];
  }

  return [screenY - destY - wHeight, Astal.WindowAnchor.BOTTOM];
};

const MainBar = (monitor: number) => {
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
          <button className="btn btn-ghost btn-primary btn-square">
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
          <button className="btn btn-square btn-ghost">
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
