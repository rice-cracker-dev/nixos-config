import { FlowBox } from '$/components';
import { Binding, bind } from 'astal';
import { Gtk, Widget } from 'astal/gtk3';
import { NullableBindableProperty } from '$/lib';
import Pango from 'gi://Pango';
import Network from './qs/Network';
import Bluetooth from './qs/Bluetooth';
import BrightnessSlider from './Brightness';
import PipewireSlider from './Pipewire';
import Notification from './Notification';

export interface QuickSettingsButtonProps {
  name: string;
  className?: string | Binding<string>;
  icon?: string | Binding<string>;
  header?: NullableBindableProperty<string>;
  subheader?: NullableBindableProperty<string>;
  onClick?: Widget.ButtonProps['onClick'];
}

export const QuickSettingsButton = ({
  name,
  className = '',
  icon,
  header,
  subheader,
  onClick = () => {},
}: QuickSettingsButtonProps) => {
  const nullableStringToProperty = (
    property?: NullableBindableProperty<string>,
  ): string | Binding<string> => {
    if (!property) {
      return '';
    }

    if (typeof property !== 'string') {
      return bind(property).as((s) => s ?? '');
    }

    return property;
  };

  return (
    <button className={className} onClick={onClick}>
      <box
        valign={Gtk.Align.CENTER}
        className={`system__qs__main system__qs__${name}__main`}
        spacing={16}
      >
        <icon valign={Gtk.Align.CENTER} icon={icon} visible={!!icon} />
        <box orientation={Gtk.Orientation.VERTICAL} valign={Gtk.Align.CENTER}>
          <label
            halign={Gtk.Align.START}
            label={nullableStringToProperty(header)}
            visible={!!header}
            className={`system__qs__header system__qs__${name}__header`}
          />
          <label
            halign={Gtk.Align.START}
            label={nullableStringToProperty(subheader)}
            visible={!!subheader}
            maxWidthChars={16}
            ellipsize={Pango.EllipsizeMode.END}
            className={`system__qs__subheader system__qs__${name}__subheader`}
          />
        </box>
      </box>
    </button>
  );
};

interface SystemLabelProps extends Widget.BoxProps {
  label: string | null;
}

export const SystemLabel = (params: SystemLabelProps) => {
  return (
    <box orientation={Gtk.Orientation.VERTICAL} spacing={4}>
      {params.label && (
        <label
          label={params.label}
          xalign={0}
          opacity={0.75}
          className="system__label"
        />
      )}
      <box {...params}>{params.children}</box>
    </box>
  );
};

const System = (params: Widget.BoxProps) => {
  return (
    <box {...params} spacing={24} orientation={Gtk.Orientation.VERTICAL}>
      <SystemLabel
        label={null}
        spacing={8}
        orientation={Gtk.Orientation.VERTICAL}
      >
        <BrightnessSlider />
        <PipewireSlider />
      </SystemLabel>

      <SystemLabel label="Quick settings">
        <FlowBox
          orientation={Gtk.Orientation.HORIZONTAL}
          minChildrenPerLine={2}
          maxChildrenPerLine={2}
          rowSpacing={8}
          columnSpacing={8}
        >
          {Network()}
          {Bluetooth()}
        </FlowBox>
      </SystemLabel>

      <SystemLabel label="Notifications">
        <Notification />
      </SystemLabel>
    </box>
  );
};

export default System;
