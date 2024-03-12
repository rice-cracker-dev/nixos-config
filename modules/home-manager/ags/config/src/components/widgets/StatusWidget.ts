import Battery from "./status/Battery";
import Network from "./status/Network";
import Volume from "./status/Volume";

const StatusWidget = () => {
  return Widget.EventBox({
    
    child: Widget.Box({
      className: 'card lg',
      spacing: 16,
      children: [Battery(), Volume(), Network()]
    }),
  });
};

export default StatusWidget;
