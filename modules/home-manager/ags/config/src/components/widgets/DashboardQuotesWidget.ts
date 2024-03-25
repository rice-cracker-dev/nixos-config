const uptimeDays = Number(Utils.exec(`uprecords -as | awk 'NR>2 { print $3 }'`).split(' ')[1]) / 60 / 60 / 24
const user = Utils.exec('bash -c "echo $USER"');

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

const DashboardQuotesWidget = () => {
  let intervalId: number | null = null;
  
  const label = Widget.Label({
    hpack: 'fill',
    hexpand: true,
    xalign: 0.5,
    justification: 'center',
    css: 'font-size: 16px',
  });

  const update = (quote: string | null = null) => {
    if (label.is_destroyed) {
      return;
    }

    label.label = quote ?? quotes[Math.floor(Math.random()*quotes.length)];
    intervalId = Utils.timeout(60000, () => update());
  }

  update();

  /*
  label.keybind(['CONTROL'], 'n', (self) => {
    if (intervalId) {
      GLib.source_remove(intervalId);
    }

    update(quotes[quotes.findIndex((q) => q === self.label)]);
  });
  */

  return label;
};

export default DashboardQuotesWidget;

