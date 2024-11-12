import { Gtk, Widget } from 'astal/gtk3';
import { bind, Variable } from 'astal';
import AstalHyprland from 'gi://AstalHyprland';

const hyprland = AstalHyprland.get_default();

const HyprlandWorkspaceWidget = ({ id }: { id: number }) => {
  const className = Variable.derive(
    [bind(hyprland, 'workspaces'), bind(hyprland, 'focusedWorkspace')],
    (workspaces, focused) => {
      const workspace = workspaces.find((w) => w.id === id);

      if (!workspace) {
        return 'hyprland__workspace';
      }

      const occupied = workspace.get_clients().length > 0;
      const active = focused.id === id;

      return `hyprland__workspace ${
        active
          ? 'hyprland__workspace_active'
          : occupied && 'hyprland__workspace_occupied'
      }`;
    }
  );

  return (
    <button
      className={className()}
      onClick={() => hyprland.dispatch('workspace', `${id}`)}
    />
  );
};

const HyprlandWidget = (
  props: Omit<Widget.EventBoxProps, 'child' | 'on_scroll' | 'onScroll'>
) => {
  return (
    <eventbox
      {...props}
      hexpand
      vexpand
      onScroll={(_, e) => {
        console.log(e.delta_y);
        hyprland.dispatch('workspace', e.delta_y > 0 ? '+1' : '-1');
      }}
    >
      <box
        halign={Gtk.Align.CENTER}
        orientation={Gtk.Orientation.VERTICAL}
        spacing={10}
      >
        {[...Array(9).keys()].map((i) => (
          <HyprlandWorkspaceWidget id={i + 1} />
        ))}
      </box>
    </eventbox>
  );
};

export default HyprlandWidget;
