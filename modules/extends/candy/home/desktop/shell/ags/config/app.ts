import { App } from 'astal/gtk3';
import { initWindows } from './windows';
import style from './styles/main.scss';

App.start({
  css: style,
  icons: './assets/icons',

  main() {
    initWindows();
  },
});
