import { MprisPlayer } from "types/service/mpris";
import { supportedName } from "src/components/widgets/MprisWidget";
import { NerdFontLabel } from "src/components/NerdFontLabel";
import Spacer from "src/components/Spacer";
import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import CavaWidget from "../CavaWidget";

const mpris = await Service.import('mpris');

const lengthStr = (length: number) => {
    const min = Math.floor(length / 60)
    const sec = Math.floor(length % 60)
    const sec0 = sec < 10 ? "0" : ""
    return `${min}:${sec0}${sec}`
}

type MprisPlayerWidgetSettings = {
  large: boolean;
  applyMprisStyle: boolean;
  showCavaWidget: boolean;
  cavaMargin: number;
};

export const MprisPlayerWidget = (
  player: MprisPlayer,
  settings?: Partial<MprisPlayerWidgetSettings>
) => {
  const {
    large,
    applyMprisStyle,
    showCavaWidget,
    cavaMargin
  }: MprisPlayerWidgetSettings = {
    large: false,
    applyMprisStyle: true,
    showCavaWidget: false,
    cavaMargin: 2,
    ...settings,
  };

  const title = Widget.Label({
    hpack: 'start',
    marginRight: 28,
    maxWidthChars: 20,
    truncate: 'end',
    css: 'font-size: 16px; font-weight: 700'
  }).bind('label', player, 'track_title');

  const artists = Widget.Label({
    hpack: 'start',
    opacity: 0.75,
    marginRight: 28,
  }).bind('label', player, 'track_artists', (o) => `By ${o.join(', ')}`)

  const progressSlider = Widget.Slider({
    drawValue: false,
    hexpand: true,
    on_change: ({ value }) => player.position = value * player.length,
      setup: (self) => {
      const update = () => {
        self.visible = player.length > 0
        self.value = player.position / player.length
      }

      self.hook(player, update)
      self.hook(player, update, "position")
      self.poll(1000, update)
    },
  });
  /*
  .hook(player, (self) => {
    const supported = supportedName[player.name];

    self.css = supported ? `
      scale trough highlight {
        background-color: lighter(${supported.color})
      }
    ` : '';
  });
  */

  const positionLabel = Widget.Label({
    class_name: "position",
    hpack: "start",
    setup: self => {
      const update = () => {
        self.label = lengthStr(player.position)
        self.visible = player.length > 0
      }

      self.hook(player, update, "position")
      self.poll(1000, update)
    },
  });

  const lengthLabel = Widget.Label({
    class_name: "length",
    hpack: "end",
    visible: player.bind("length").transform(l => l > 0),
    label: player.bind("length").transform(lengthStr),
  });

  const playPause = Widget.Button({
    class_name: "play-pause",
    on_clicked: () => player.playPause(),
    visible: player.bind("can_play"),
    child: NerdFontLabel({
      label: player.bind("play_back_status").transform(s => {
        switch (s) {
          case "Playing": return '󰏤'
          case "Paused":
          case "Stopped": return '󰐊'
        }
      }),
    }),
  })

  const prev = Widget.Button({
    on_clicked: () => player.previous(),
    className: 'icon',
    visible: player.bind("can_go_prev"),
    child: NerdFontLabel({ label: '󰒮' }),
  });

  const next = Widget.Button({
    on_clicked: () => player.next(),
    className: 'icon',
    visible: player.bind("can_go_next"),
    child: NerdFontLabel({ label: '󰒭' }),
  })

  const controls = Widget.Box({
    css: 'min-height: 48px',

    child: Widget.CenterBox({
      vpack: 'end',
      hexpand: true,
      spacing: 8,

      startWidget: positionLabel,
      endWidget: lengthLabel,
      centerWidget: Widget.Box({
        css: 'font-size: 18px',
        children: [
          prev,
          playPause,
          next
        ]
      }),
    })
  });

  const controlsOverlay = Widget.Overlay({
    passThrough: true,
    child: controls,
  });

  if (showCavaWidget) {
    // @ts-ignore
    controlsOverlay.overlay = Widget.Box({
      css: `margin-bottom: ${cavaMargin}px`,
      child: CavaWidget({ barHeight: 48 - cavaMargin, spacing: 4 })
    });
  }

  const contents = Widget.Box({
    spacing: large ? 24 : 12,
    margin: large ? 16 : 8,

    children: [
      Widget.Box({
        className: 'img-cover',
        css: player
          .bind('track_cover_url')
          .as((cover) => `background-image: url('${cover}')`),
      }),

      Widget.Box({
        hexpand: true,
        vertical: true,

        children: [
          title,
          artists,
          Spacer(),
          controlsOverlay,
          progressSlider,
        ],
      }),
    ],
  })

  return Widget.Box({
    hexpand: true,
    child: Widget.Overlay({
      hexpand: true,
      child: contents,

      overlay: NerdFontLabel({
        hpack: 'end',
        vpack: 'start',
        css: `font-size: 24px; margin: ${large ? '16px' : '4px'}`,
      }).hook(player, (self) => {
        const supported = supportedName[player.name];
        self.visible = !!supported;

        if (supported) {
          self.label = supported.icon;
        }
      }),
    })
  }).hook(player, (self) => {
    if (applyMprisStyle) {
      self.class_name = `card outline mpris-${player.name}`
    }
  });
};

const MprisPopover = () => {
  return Widget.subclass(Gtk.Popover)({
    // @ts-ignore
    child: Widget.Box({
      widthRequest: 400,
      className: 'card',
      css: 'padding: 8px',
      vertical: true,
      spacing: 8,
      children: [
        Widget.Label({
          label: 'Players',
          css: 'font-size: 20px',
          hpack: 'start',
        }),
        Widget.Box({
          spacing: 8,
          vertical: true
        }).bind(
          'children',
          mpris,
          'players',
          (o) => o.map((p) => MprisPlayerWidget(p)))
      ],
    }),
  });
};

export default MprisPopover;

