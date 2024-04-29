import Battery from "./status/Battery";
import Network from "./status/Network";
import Volume from "./status/Volume";

const StatusWidget = (vertical = false) => {
  return Widget.EventBox({
    child: Widget.Box({
      vertical,
      className: 'card outline lg',
      spacing: 16,
      children: [Battery(), Volume(), Network()]
    }),
  });
};

export default StatusWidget;
