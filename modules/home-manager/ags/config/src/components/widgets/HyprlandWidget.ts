const hyprland = await Service.import('hyprland');

const HyprlandWorkspaceWidgetButton = (id: number) =>
  Widget.Button({
    onClicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
    label: `${id}`,
  }).hook(hyprland, (self) => {
    self.toggleClassName('active', hyprland.active.workspace.id === id)
  });

export const HyprlandWorkspaceWidget = () => Widget.EventBox({
  onScrollUp: () => hyprland.messageAsync(`dispatch workspace +1`),
  onScrollDown: () => hyprland.messageAsync(`dispatch workspace -1`),
  child: Widget.Box({
    className: 'card',
    spacing: 4,
    children: Array
      .from({ length: 9 }, (_, i) => i + 1)
      .map(HyprlandWorkspaceWidgetButton),
  })
});

