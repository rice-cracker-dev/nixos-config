import Image from "src/components/Image/index";
import { Application } from "types/service/applications";

export const windowName = 'ags-startmenu';
export const isOpen = Variable<boolean>(false);
globalThis.toggleStartMenu = () => isOpen.setValue(!isOpen.value);

const { query } = await Service.import('applications');

const StartMenuWindow = () => {
  const applications = Variable<Application[]>([]);
  const selectedIndex = Variable<number>(0);
  let entryText = '';

  const repopulate = () => {
    applications.setValue(query(entryText));
    selectedIndex.setValue(0);
  };

  const AppItemWidget = (app: Application, index: number) => {
    return Widget.Button({
      attribute: { index },
      can_focus: false,
      css: 'padding: 2px 0',
      child: Widget.Box({
        spacing: 4,
        children: [
          Widget.Icon({ icon: app.icon_name ?? '' }),
          Widget.Label(app.name),
        ],
      }),
    }).hook(selectedIndex, (self) => {
      self.class_names = ['menuitem'];

      if (selectedIndex.value === self.attribute.index) {
        self.class_names = [...self.class_names, 'menuitem-active'];
      }
    });
  };

  const logo = Widget.Box({
    css: 'min-width: 32px; background-color: @base02',
    vexpand: true,
    child: Image({
      src: `${App.configDir}/src/assets/hypr95_vertical.svg`,
      width: 32, height: 128
    }, { vpack: 'end' })
  })

  const entry = Widget.Entry({
    class_name: 'entry',
    placeholderText: 'Search',
    text: entryText,

    on_change: ({ text }) => {
      entryText = text ?? '';
      repopulate();
    },

    on_accept: () => {
      applications.value[selectedIndex.value]?.launch();
      isOpen.setValue(false);
    },
  }).hook(isOpen, (self) => {
    self.grab_focus();
  });

  const apps = Widget.Box({
    vertical: true,
    vexpand: true,

    setup: () => repopulate(),
    
    children: [
      Widget.Scrollable({
        vexpand: true,
        can_focus: false,
        css: 'min-width: 192px',

        child: Widget.Box({
          vertical: true,
          vpack: 'end',
          can_focus: false,
          children: applications.bind().as((a) => a.map(AppItemWidget)),
        }),
      }),

      entry,
    ],
  });

  return Widget.Window({
    name: windowName,
    anchor: ['bottom', 'left'],
    exclusivity: 'normal',

    keymode: isOpen.bind().as((o) => o ? 'exclusive' : 'none'),
      visible: isOpen.bind(),

    setup: (self) => {
      self.keybind('Escape', () => {
        isOpen.setValue(false);
      });

      self.keybind('Up', () => {
        if (selectedIndex.value > 0) {
          selectedIndex.setValue(selectedIndex.value - 1);
        }
      });

      self.keybind('Down', () => {
        if (selectedIndex.value < applications.value.length - 1) {
          selectedIndex.setValue(selectedIndex.value + 1);
        }
      });
    },

    child: Widget.Box({
      class_name: 'card card-outset',
      css: 'min-height: 320px',
      spacing: 4,

      children: [
        logo,
        apps,
      ],
    }),
  });
};

export default StartMenuWindow;

