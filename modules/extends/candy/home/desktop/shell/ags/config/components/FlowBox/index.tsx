import { GObject } from 'astal';
import { Gtk, astalify, ConstructProps } from 'astal/gtk3';

// subclass, register, define constructor props
export default class FlowBox extends astalify(Gtk.FlowBox) {
  static {
    GObject.registerClass(this);
  }

  constructor(
    props: ConstructProps<
      FlowBox,
      Gtk.FlowBox.ConstructorProps,
      {} // signals of Gtk.FlowBox have to be manually typed
    >
  ) {
    super(props as any);
  }
}
