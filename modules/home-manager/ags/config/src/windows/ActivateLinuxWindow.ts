const ActivateLinuxWindow = () => {
  return Widget.Window({
    anchor: ['right', 'bottom'],
    margins: [96, 206],
    sensitive: false,
    clickThrough: true,
    exclusivity: 'ignore',
    layer: 'background',
    child: Widget.Box({
      vertical: true,
      spacing: 2,
      opacity: 0.5,
      children: [
        Widget.Label({
          css: 'font-size: 24px',
          label: 'Activate NixOS',
          hpack: 'start',
        }),
        Widget.Label({
          css: 'font-size: 16px',
          label: 'Go to Settings to activate NixOS.',
          hpack: 'start',
        }),
      ],
    }),
  })
};

export default ActivateLinuxWindow;

