import { HyprlandWorkspaceWidget } from "src/components/widgets/HyprlandWidget";
import Spacer from "src/components/Spacer";
import StatusWidget from "src/components/widgets/StatusWidget";
import SystemTrayWidget from "src/components/widgets/SystemTrayWidget";
import TimeWidget from "src/components/widgets/TimeWidget";
import HomeWidget from "src/components/widgets/HomeWidget";
import MprisWidget from "src/components/widgets/MprisWidget";

export const windowName = 'ags-mainbar';

const MainBarWindow = () => Widget.Window({
  name: windowName,
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  margins: [8, 8, 0, 8],
  child: Widget.Box({
    vertical: false,
    spacing: 8,
    children: [
      HyprlandWorkspaceWidget(),
      Spacer(),
      SystemTrayWidget(),
      MprisWidget(),
      StatusWidget(),
      TimeWidget(),
      HomeWidget(),
    ],
  }),
});

export default MainBarWindow;
