import { NerdFontLabel } from "src/components/NerdFontLabel";
import { getValueFromArrayRange } from "src/utils";

const battery = await Service.import('battery');

const batteryIcons = ['󰂎', '󰁺', '󰁻', '󰁼', '󰁽', '󰁾', '󰁿', '󰂀', '󰂁', '󰂂', '󰁹'];

const Battery = () => {
  const reveal = Variable(false);

  return Widget.EventBox({
    onPrimaryClick: () => reveal.setValue(!reveal.value),
    child: Widget.Box({
      children: [
        NerdFontLabel({
          label: battery
            .bind('percent')
            .as((percent) => getValueFromArrayRange(batteryIcons, 0, 100, percent))
        }),

        Widget.Revealer({
          revealChild: reveal.bind(),
          transition: 'slide_left',
          child: Widget.Label({ marginLeft: 8 }).hook(battery, (self) => {
            self.label = `${battery.percent}%`;

            if (battery.charging) {
              self.label += ' (Charging)';
            }
          }),
        }),
      ],
    }),
  });
};

export default Battery;

