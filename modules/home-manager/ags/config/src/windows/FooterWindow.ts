import DashboardDynamicWidget from 'src/components/widgets/DashboardDynamicWidget';

export const windowName = 'ags-footer';

export const FooterWindow = () => {
  return Widget.Window({
    anchor: ['bottom'],
    layer: 'background',

    child: Widget.Box({
      css: 'margin: 4px',
      vertical: true,
      children: [
        DashboardDynamicWidget(),
      ],
    }),
  });
};

export default FooterWindow;

