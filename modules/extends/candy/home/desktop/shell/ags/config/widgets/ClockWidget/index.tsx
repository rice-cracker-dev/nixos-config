import { Card } from '$/components';
import { time } from '$/lib';
import Gtk from 'gi://Gtk';

const ClockWidget = () => {
  return (
    <Card spacing={4}>
      <icon
        icon="clock-fill-symbolic"
        valign={Gtk.Align.CENTER}
        className="text-primary"
      />
      <label
        valign={Gtk.Align.CENTER}
        label={time().as((date) =>
          date.toLocaleString(undefined, {
            minute: '2-digit',
            hour: '2-digit',
            hour12: true,
          })
        )}
      />
    </Card>
  );
};

export default ClockWidget;
