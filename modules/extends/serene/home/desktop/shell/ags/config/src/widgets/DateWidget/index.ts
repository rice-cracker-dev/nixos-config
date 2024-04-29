export const datePoll = Variable(new Date(), {
  poll: [1000, 'date +%s', (time) => new Date(Number(time) * 1000)]
})

const DateWidget = () => {
  return Widget.Box({
    vpack: 'center',

    child: Widget.Label().bind(
      'label',
      datePoll,
      'value',
      (val) => val.toLocaleTimeString(undefined, {
        timeStyle: 'short',
      })
    ),
  });
};

export default DateWidget;

