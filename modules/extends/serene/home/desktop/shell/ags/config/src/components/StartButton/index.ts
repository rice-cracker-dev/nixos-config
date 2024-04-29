import Image from "../Image/index";

const StartButton = () => {
  return Widget.Button({
    class_name: 'btn',
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
  });
};

export default StartButton;
