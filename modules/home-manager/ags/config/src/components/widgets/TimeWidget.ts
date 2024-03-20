import { NerdFontLabel } from "../NerdFontLabel";

const formatTime = (date: Date) => {
  /*
  const hours = date.getHours();
  const minutes = date.getMinutes();
  const seconds = date.getSeconds();

  return `${hours}:${minutes}:${seconds}`;
  */

  return date.toLocaleTimeString(undefined, {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false,
  });
};

const timePoll = Variable<Date>(new Date(), {
  poll: [1000, 'date +%s', (o) => new Date(Number(o) * 1000)]
});

const TimeWidget = (vertical = false) => Widget.Box({
  vertical,
  className: 'card lg',
  spacing: 8,
  children: [
    NerdFontLabel({ label: '󰥔', css: 'color: @base0E' }),
    vertical
      ? Widget.Box({
        vertical: true,
        children: [
          Widget.Label().bind('label', timePoll, 'value', (o) => `${o.getHours()}`),
          Widget.Label().bind('label', timePoll, 'value', (o) => `${o.getMinutes()}`),
          Widget.Label().bind('label', timePoll, 'value', (o) => `${o.getSeconds()}`),
        ],
      })
      : Widget.Label({
        label: timePoll.bind().as(formatTime),
      }),
  ],
});

export default TimeWidget;
