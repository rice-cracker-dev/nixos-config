import { Variable, exec, execAsync, monitorFile } from 'astal';
import { clamp } from '../utils';

const init = () => {
  const maxBrightness = Number(exec('brightnessctl max'));
  const backlightInterface = exec(
    "sh -c 'ls -w1 /sys/class/backlight | head -1'"
  );
  const brightnessVar = Variable(0);

  monitorFile(`/sys/class/backlight/${backlightInterface}/brightness`, () => {
    const screenValue = Number(exec('brightnessctl get')) / maxBrightness;

    brightnessVar.set(screenValue);
  });

  return brightnessVar;
};

export const brightness = init;

export const setBrightness = (percent: number) => {
  percent = clamp(percent, 0, 1);
  execAsync(`brightnessctl set ${percent * 100}% -q`);
};
