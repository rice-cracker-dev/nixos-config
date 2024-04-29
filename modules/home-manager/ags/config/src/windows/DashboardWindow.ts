import DashboardDynamicWidget from 'src/components/widgets/DashboardDynamicWidget';
import DashboardTimeWidget from 'src/components/widgets/DashboardTimeWidget';
import CavaWidget from 'src/components/widgets/CavaWidget';

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

