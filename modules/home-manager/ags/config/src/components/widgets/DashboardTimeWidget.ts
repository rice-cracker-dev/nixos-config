import { LabelProps } from "types/widgets/label";
import { StackProps } from "types/widgets/stack";
import { formattedTimePoll as timePoll } from "./TimeWidget";

const ScrollingNumberWidget = (stackProps?: StackProps, labelProps?: LabelProps) => {
  return Widget.Stack({
    ...stackProps,
    items: [...Array(10).keys()].map((o) => [
      `${o}`,
      Widget.Label({ ...labelProps, label: `${o}` })
    ]),
  });
};

const DashboardTimeWidget = () => {
  const labelProps: LabelProps = {
    className: 'text-heading',
    css: 'font-size: 72px',
  };

  const stackProps: StackProps = {
    transition: 'slide_up',
    transitionDuration: 1000,
  };

  return Widget.Box({
    hpack: 'center',
    children: [
      ScrollingNumberWidget(stackProps, labelProps).bind('shown', timePoll, 'value', (o) => o[0]),
      ScrollingNumberWidget(stackProps, labelProps).bind('shown', timePoll, 'value', (o) => o[1]),
      Widget.Label({ ...labelProps, label: ':' }),
      ScrollingNumberWidget(stackProps, labelProps).bind('shown', timePoll, 'value', (o) => o[3]),
      ScrollingNumberWidget(stackProps, labelProps).bind('shown', timePoll, 'value', (o) => o[4]),
    ],
  });
};

export default DashboardTimeWidget;

