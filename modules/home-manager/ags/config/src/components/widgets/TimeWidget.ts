import { NerdFontLabel } from "../NerdFontLabel";

const timePoll = Variable('', { poll: [1000, 'date +%H:%M:%S'] });

const TimeWidget = () => Widget.Box({
  className: 'card lg',
  spacing: 8,
  children: [
    NerdFontLabel({ label: '󰥔', css: 'color: @base0E' }),
    Widget.Label({ label: timePoll.bind() }),
  ],
});

export default TimeWidget;
