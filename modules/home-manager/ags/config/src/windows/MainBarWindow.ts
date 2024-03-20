import { HyprlandWorkspaceWidget } from "src/components/widgets/HyprlandWidget";
import Spacer from "src/components/Spacer";
import StatusWidget from "src/components/widgets/StatusWidget";
import SystemTrayWidget from "src/components/widgets/SystemTrayWidget";
import TimeWidget from "src/components/widgets/TimeWidget";
import HomeWidget from "src/components/widgets/HomeWidget";
import MprisWidget from "src/components/widgets/MprisWidget";

export const windowName = 'ags-mainbar';

const MainBarWindow = (vertical = false) => Widget.Window({
  name: windowName,
  anchor: vertical ? ['top', 'bottom', 'right'] : ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  margins: vertical ? [8, 8, 8, 0] : [8, 8, 0, 8],
  child: Widget.Box({
    className: 'card outline',
    vertical,
    spacing: 4,
    children: [
      HyprlandWorkspaceWidget(vertical),
      Spacer(),
      SystemTrayWidget(vertical),
      MprisWidget(),
      StatusWidget(vertical),
      TimeWidget(vertical),
      HomeWidget(),
    ],
  }),
});

export default MainBarWindow;
