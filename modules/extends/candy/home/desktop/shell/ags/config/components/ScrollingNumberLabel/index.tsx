import { Widget } from 'astal/gtk3';

export interface ScrollingNumberWidgetProps extends Widget.StackProps {
  labelProps: Widget.LabelProps;
}

const ScrollingNumberWidget = ({
  labelProps,
  ...stackProps
}: ScrollingNumberWidgetProps) => {
  return (
    <stack {...stackProps}>
      {[...Array(10).keys()].map((o) => (
        <label {...labelProps} name={`${o}`} label={`${o}`} />
      ))}
    </stack>
  );
};

export default ScrollingNumberWidget;
