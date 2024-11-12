import { App, Astal, Gtk } from 'astal/gtk3';
import { Variable } from 'astal';
import System from './System';

export enum SidebarMenuType {
  SYSTEM = 'system',
  NONE = 'none',
}

export const currentMenuType = Variable<SidebarMenuType>(
  SidebarMenuType.SYSTEM,
);

export const toggleMenuType = (type: SidebarMenuType) => {
  currentMenuType.set(
    currentMenuType.get() === type ? SidebarMenuType.NONE : type,
  );
};

const SideBar = (monitor: number) => {
  return (
    <window
      className="mainbar"
      monitor={monitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.BOTTOM |
        Astal.WindowAnchor.RIGHT
      }
      application={App}
    >
      <revealer
        transitionDuration={150}
        transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
        revealChild={currentMenuType((type) => type !== SidebarMenuType.NONE)}
      >
        <stack
          transitionType={Gtk.StackTransitionType.SLIDE_LEFT}
          className="sidebar__content"
          setup={(self) => {
            self.shown = SidebarMenuType.SYSTEM;

            self.hook(currentMenuType, () => {
              const type = currentMenuType.get();

              if (type !== SidebarMenuType.NONE) {
                self.shown = type;
              }
            });
          }}
        >
          <box name={SidebarMenuType.NONE} />
          <System name={SidebarMenuType.SYSTEM} />
        </stack>
      </revealer>
    </window>
  );
};

export default SideBar;
