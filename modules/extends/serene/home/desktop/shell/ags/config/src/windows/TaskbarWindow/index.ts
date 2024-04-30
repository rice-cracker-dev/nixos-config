import StartButton from 'src/components/StartButton/index';
import SystemWidget from 'src/widgets/SystemWidget/index';
import HyprlandWidget from 'src/widgets/HyprlandWidget/index';
import MprisWidget from 'src/widgets/MprisWidget/index';

const TaskbarWindow = () => {
  return Widget.Window({
    name: 'ags-taskbar',
    anchor: ['left', 'bottom', 'right'],
    exclusivity: 'exclusive',

    child: Widget.Box({
      class_name: 'taskbar',
      spacing: 2,
      children: [
        StartButton(),
        HyprlandWidget(),
        MprisWidget(),
        SystemWidget(),
      ],
    }),
  });
};

export default TaskbarWindow;
