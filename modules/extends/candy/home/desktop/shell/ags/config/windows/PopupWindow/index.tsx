import { App, Astal, Binding, Widget } from 'astal';

export enum PopupWindowPosition {
  TOP,
  BOTTOM,
}

export interface PopupWindowProps
  extends Omit<
    Widget.WindowProps,
    'marginRight' | 'marginBottom' | 'marginTop' | 'anchor' | 'application'
  > {
  position?: PopupWindowPosition | Binding<PopupWindowPosition>;
  offsetX?: number | Binding<number>;
  offsetY?: number | Binding<number>;
}

const PopupWindow = ({
  monitor,
  position,
  offsetX,
  offsetY,
  ...props
}: PopupWindowProps) => {
  return (
    <window
      {...props}
      marginRight={offsetX}
      marginBottom={position === PopupWindowPosition.BOTTOM ? offsetY : 0}
      marginTop={position === PopupWindowPosition.TOP ? offsetY : 0}
      monitor={monitor}
      application={App}
      anchor={
        Astal.WindowAnchor.RIGHT |
        (position === PopupWindowPosition.BOTTOM
          ? Astal.WindowAnchor.BOTTOM
          : Astal.WindowAnchor.TOP)
      }
    />
  );
};

export default PopupWindow;
