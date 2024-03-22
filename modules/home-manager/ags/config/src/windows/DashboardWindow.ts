import DashboardTimeWidget from 'src/components/widgets/DashboardTimeWidget';
import QuotesWidget from 'src/components/widgets/QuotesWidget';

export const windowName = 'ags-window';

export const DashboardWindow = () => {
  return Widget.Window({
    layer: 'background',

    child: Widget.Box({
      vertical: true,
      children: [
        DashboardTimeWidget(),
        QuotesWidget(),
      ],
    }),
  });
};

export default DashboardWindow;

