const version = Variable('', {
  // periodic version check
  poll: [5000, 'nixos-version'],
});

const NonGenuineWindow = () => {
  return Widget.Window({
    name: 'ags-non-geniune',
    layer: 'background',
    anchor: ['bottom', 'right'],

    child: Widget.Box({
      css: 'margin: 1px',
      vertical: true,
      children: [
        Widget.Label({
          hpack: 'end',
          label: 'This version of NixOS is not genuine'
        }),
        Widget.Label({ hpack: 'end' }).bind('label', version, 'value', (v) => `NixOS ${v}`),
      ],
    }),
  });
};

export default NonGenuineWindow;
