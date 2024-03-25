import { NerdFontLabel } from "../NerdFontLabel";

export const formatTime = (date: Date) => {
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

export const timePoll = Variable<Date>(new Date(), {
  poll: [1000, 'date +%s', (o) => new Date(Number(o) * 1000)]
});

export const formattedTimePoll = Utils.derive([timePoll], (o) => formatTime(o));

const TimeWidget = (vertical = false) => Widget.Box({
  vertical,
  className: 'card outline',
  child: Widget.Button({
    child: Widget.Box({
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
              label: formattedTimePoll.bind(),
            }),
      ]
    })
  }),
});

export default TimeWidget;
