import { Gtk, Variable, Widget, bind } from 'astal';
import { ScrollingNumberLabel } from '$/components';
import { time } from '$/lib';

const formattedTime = Variable.derive([time], (t) =>
  t.toLocaleString(undefined, {
    hour12: false,
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
  })
);

const ClockWidget = (props: Omit<Widget.BoxProps, 'child' | 'children'>) => {
  const stackProps: Widget.StackProps = {
    transitionType: Gtk.StackTransitionType.SLIDE_DOWN,
    transitionDuration: 500,
  };

  const labelProps: Widget.LabelProps = {
    css: 'font-weight: bold',
    className: 'text-text',
  };

  return (
    <box {...props} spacing={2} orientation={Gtk.Orientation.VERTICAL}>
      <box>
        <ScrollingNumberLabel
          {...stackProps}
          labelProps={labelProps}
          shown={formattedTime((t) => t[0])}
        />
        <ScrollingNumberLabel
          {...stackProps}
          labelProps={labelProps}
          shown={formattedTime((t) => t[1])}
        />
      </box>
      <box>
        <ScrollingNumberLabel
          {...stackProps}
          labelProps={labelProps}
          shown={formattedTime((t) => t[3])}
        />
        <ScrollingNumberLabel
          {...stackProps}
          labelProps={labelProps}
          shown={formattedTime((t) => t[4])}
        />
      </box>
    </box>
  );
};

export default ClockWidget;
