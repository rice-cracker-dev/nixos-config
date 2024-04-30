import { isOpen } from "src/windows/StartMenuWindow/index";
import Image from "../Image/index";

const StartButton = () => {
  return Widget.Button({
    on_primary_click: () => isOpen.setValue(!isOpen.value),

    child: Widget.Box({
      spacing: 4,
      children: [
        Image({
          src: `${App.configDir}/src/assets/nixos.png`,
          width: 16,
          height: 16,
        }, { vpack: 'center' }),

        Widget.Label({
          label: 'Start',
          vpack: 'center',
        }),
      ],
    }),
  }).hook(isOpen, (self) => {
    self.class_names = ['btn'];

    if (isOpen.value) {
      self.class_names = [...self.class_names, 'btn-active'];
    }
  });
};

export default StartButton;
