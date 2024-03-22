const uptimeDays = Number(Utils.exec('cat /proc/uptime').split(' ')[1]) / 60 / 60 / 24
const user = Utils.exec('hostname');

const quotes = [
  `rise and shine, ${user}`,
  "rice, rice and rice",
  `you haven't showered for ${uptimeDays} days`,
  '"use nixos" - poz',
  '"Bro got that Bussy (bear pussy)" - SheepMilk',
  '"Stop using nixos!" - loss',
  '"I use nixos" - loss',
  '"rust gives you tools, go makes you a tool" - quickshill',
  '"unit testing is for the weak, real chads push to production without any tests" - let',
  '"hypr" - poz',
  '"just use arch" - crispy caesus',
  '"dont self promo" - vaxry'
];

const QuotesWidget = () => {
  const label = Widget.Label({
    hpack: 'center',
    css: 'font-size: 16px',
  });

  Utils.interval(60000, () => {
    label.label = quotes[Math.floor(Math.random()*quotes.length)];
  }, label)

  return label;
};

export default QuotesWidget;

