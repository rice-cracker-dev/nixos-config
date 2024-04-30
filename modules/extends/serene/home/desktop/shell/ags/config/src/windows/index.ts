import NonGenuineWindow from './NonGenuineWindow/index';
import StartMenuWindow from './StartMenuWindow/index';
import TaskbarWindow from './TaskbarWindow/index';

export const windows = [
  TaskbarWindow(),
  StartMenuWindow(),
  NonGenuineWindow(),
];
