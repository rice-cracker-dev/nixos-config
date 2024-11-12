import { GLib } from 'astal';
import MainBar from './MainBar';
import SideBar from './SideBar';

export const debug = GLib.getenv('DEBUG') === '1';

export const initWindows = () => {
  MainBar(0);
  SideBar(0);
};
