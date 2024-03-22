const battery = await Service.import('battery');

const batteryIcon = 'battery-symbolic';
const batteryCautionIcon = 'battery-caution-symbolic'; // 40%
const batteryLowIcon = 'battery-low-symbolic'; // 20%


const VolumeWidget = () => {
  return Widget.Box({
    className: 'card outline',
    child: Widget.Button({
      child: Widget.Box({
        spacing: 8,
        children: [
          Widget.Icon().hook(battery, (self) => {
            self.icon =
              battery.percent <= 20 ? batteryLowIcon
              : battery.percent <= 40 ? batteryCautionIcon : batteryIcon;
          }),


          Widget.Label({ css: 'padding-right: 4px' })
          .bind('label', battery, 'percent', (v) => `${v}%`)
        ],
      }),
    })
  });
};

export default VolumeWidget;
