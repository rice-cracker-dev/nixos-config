import { Mdl2Label } from "src/components/Mdl2Label";
import { NerdFontLabel } from "src/components/NerdFontLabel";
import Spacer from "src/components/Spacer";
import { timePoll } from "src/components/widgets/TimeWidget";

export const windowName = 'ags-taskbar'

const TaskbarWindow = () => {
  return Widget.Window({
    name: windowName,
    exclusivity: 'exclusive',
    anchor: ['bottom', 'left', 'right'],
    visible: false,

    child: Widget.Box({
      className: 'taskbar',
      children: [
        Widget.Button({
          child: NerdFontLabel({ label: '', css: 'font-size: 16px' }),
        }),
        Widget.Button({
          child: Mdl2Label({ label: String.fromCodePoint(0xE721) }),
        }),
        Widget.Button({
          child: Mdl2Label({ label: String.fromCodePoint(0xEE40) }),
        }),
        Spacer(),
        Widget.Button({
          className: 'systray',
          child: Mdl2Label({ label: String.fromCodePoint(0xE971) }),
        }),
        Widget.Button({
          className: 'systray',
          child: Mdl2Label({ label: String.fromCodePoint(0xE839) }),
        }),
        Widget.Button({
          className: 'systray',
          child: Mdl2Label({ label: String.fromCodePoint(0xE767) }),
        }),
        Widget.Button({
          className: 'time',
          child: Widget.Box({
            vertical: true,
            vpack: 'center',
            children: [
              Widget.Label().bind('label', timePoll, 'value', (date) => date.toLocaleTimeString(undefined, {
                hour: 'numeric',
                minute: '2-digit',
                hour12: true,
              })),
              Widget.Label().bind('label', timePoll, 'value', (date) => date.toLocaleDateString()),
            ],
          }),
        }),
        Widget.Button({
          className: 'notification',
          child: Mdl2Label({ label: String.fromCodePoint(0xED0D) }),
        }),
        Widget.Button({ className: 'showdesktop' }),
      ],
    }),
  });
};

export default TaskbarWindow;

