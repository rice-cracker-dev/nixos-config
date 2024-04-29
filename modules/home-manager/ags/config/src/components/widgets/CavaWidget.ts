export const barsNumber = 32;

export const bars = Variable<number[]>([], {
  listen: [[
    'bash',
    '-c',
    `printf "[general]\n \
      bars = ${barsNumber}\n \
      autosens = 0\n \
      sensitivity = 200\n \
      [output]\n \
      method = raw\n \
      raw_target = /dev/stdout\n \
      data_format = ascii\n \
      ascii_max_range = 1000" | \
      cava -p /dev/stdin`
  ], (o) => o.split(';').map(o => Number(o))]
});

interface CavaWidgetParams {
  barHeight: number;
  spacing: number;
}

const CavaWidget = (params: CavaWidgetParams) => {
  const widget = Widget.Box({
    css: `min-height: ${params.barHeight}px;`,
    spacing: params.spacing,
    hexpand: true,
  });

  widget.children = [...Array(barsNumber).keys()].map((k) => Widget.Box({
    className: 'cava-bar',
    hexpand: true,
    vpack: 'end',
    heightRequest: bars.bind().as((b) => b[k] / 1000 * params.barHeight),
  }))

  return widget;
};

export default CavaWidget;

