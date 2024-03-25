import { HyprlandWorkspaceWidget } from "src/components/widgets/HyprlandWidget";
import Spacer from "src/components/Spacer";
import SystemTrayWidget from "src/components/widgets/SystemTrayWidget";
import TimeWidget from "src/components/widgets/TimeWidget";
import HomeWidget from "src/components/widgets/HomeWidget";
import MprisWidget from "src/components/widgets/MprisWidget";
import VolumeWidget from 'src/components/widgets/VolumeWidget';
import BatteryWidget from 'src/components/widgets/BatteryWidget';
import NetworkWidget from 'src/components/widgets/NetworkWidget';

export const windowName = 'ags-mainbar';

const MainBarWindow = (vertical = false) => Widget.Window({
  name: windowName,
  anchor: vertical ? ['top', 'bottom', 'right'] : ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  margins: vertical ? [8, 8, 8, 0] : [8, 8, 0, 8],
  child: Widget.Box({
    vertical,
    spacing: 4,
    children: [
      HyprlandWorkspaceWidget(vertical),
      Spacer(),
      MprisWidget(),
      SystemTrayWidget(vertical),
      BatteryWidget(),
      VolumeWidget(),
      NetworkWidget(),
      TimeWidget(vertical),
      HomeWidget(),
    ],
  }),
});

export default MainBarWindow;
