import { windows } from './windows/index';

const styleDir = `${App.configDir}/src/styles`
const styleEntry = `${styleDir}/index.scss`;
const styleTarget = '/tmp/ags/style.css';

const compileStyle = () => {
  print('Compiling css...');

  Utils.exec(`sassc ${styleEntry} ${styleTarget}`);
  App.resetCss();
  App.applyCss(styleEntry);

  return styleEntry;
}

// hot-reload css
Utils.monitorFile(styleDir, () => compileStyle());

App.config({
  windows: Object.values(windows),
  style: compileStyle(),
});
