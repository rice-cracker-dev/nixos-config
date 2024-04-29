import DateWidget from "../DateWidget/index";
import SystemTrayWidget from "../SystemTrayWidget/index";

const SystemWidget = () => {
  return Widget.Box({
    class_name: 'card',
    vexpand: true,
    spacing: 4,
    children: [
      SystemTrayWidget(),
      DateWidget(),
    ],
  });
};

export default SystemWidget;

