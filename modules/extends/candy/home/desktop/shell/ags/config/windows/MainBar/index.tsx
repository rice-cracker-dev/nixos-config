import { App, Astal, Gtk } from 'astal';
import { ClockWidget, StatusWidget } from '$/widgets';

const MainBar = (monitor: number) => {
  return (
    <window
      className="Bar"
      monitor={monitor}
      margin={4}
      marginBottom={0}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      application={App}
    >
      <centerbox>
        <button onClicked="echo hello" halign={Gtk.Align.START}>
          Welcome to AGS!
        </button>
        <box />
        <box halign={Gtk.Align.END} spacing={4}>
          <StatusWidget />
          <ClockWidget />
        </box>
      </centerbox>
    </window>
  );
};

export default MainBar;
