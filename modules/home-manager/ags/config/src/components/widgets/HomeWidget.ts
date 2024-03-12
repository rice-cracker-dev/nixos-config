import { NerdFontLabel } from "../NerdFontLabel";

const HomeWidget = () => Widget.Box({
  className: 'card',
  child: Widget.Button({
    className: 'icon',
    child: NerdFontLabel({
      label: '󱄅',
      css: 'font-size: 18px; color: @base0D'
    }),
  }),
});

export default HomeWidget;
