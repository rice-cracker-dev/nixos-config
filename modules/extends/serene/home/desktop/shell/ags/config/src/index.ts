import { windows } from './windows/index';
import Gtk from 'types/@girs/gtk-3.0/gtk-3.0';

export const distDir = '/tmp/ags';
export const assetsDir = () => `${App.configDir}/assets`;

const styleDir = `${App.configDir}/src/styles`
const styleEntry = `${styleDir}/index.css`;

const compileStyle = () => {
  App.resetCss();
  App.applyCss(styleEntry);

  return styleEntry;
}

const settings = Gtk.Settings.get_default();
if (settings) {
  settings.gtk_xft_antialias = 0;
}

// hot-reload css
Utils.monitorFile(styleDir, () => compileStyle());

App.config({
  windows,
  style: compileStyle(),
});

