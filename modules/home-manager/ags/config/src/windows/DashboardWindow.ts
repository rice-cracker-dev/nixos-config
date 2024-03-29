import DashboardDynamicWidget from 'src/components/widgets/DashboardDynamicWidget';
import DashboardTimeWidget from 'src/components/widgets/DashboardTimeWidget';

export const windowName = 'ags-window';

export const DashboardWindow = () => {
  return Widget.Window({
    layer: 'background',

    child: Widget.Box({
      vertical: true,
      children: [
        DashboardTimeWidget(),
        DashboardDynamicWidget(),
      ],
    }),
  });
};

export default DashboardWindow;

