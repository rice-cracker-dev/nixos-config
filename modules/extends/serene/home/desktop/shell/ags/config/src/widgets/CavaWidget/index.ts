export const barsNumber = 8;

export const bars = Variable<number[]>([], {
  listen: [[
    'bash',
    '-c',
    `printf "[general]\n \
      bars = ${barsNumber}\n \
      autosens = 0\n \
      sensitivity = 400\n \
      [output]\n \
      method = raw\n \
      raw_target = /dev/stdout\n \
      data_format = ascii\n \
      ascii_max_range = 1000" | \
      cava -p /dev/stdin`
  ], (o) => o.split(';').map(o => Number(o))]
});

const CavaWidget = (params: {
  barWidth: number;
  barHeight: number;
  spacing: number;
}) => {
  return Widget.Box({
    css: `min-height: ${params.barHeight}px`,
    spacing: params.spacing,
    vpack: 'center',

    children: [...Array(barsNumber).keys()].map((k) => Widget.Box({
      vpack: 'end',
      class_name: 'cava-bar',
      css: bars.bind().as((bars) => `
        min-width: ${params.barWidth}px;
        min-height: ${bars[k] / 1000 * params.barHeight}px;
      `),
    }))
  });
};

export default CavaWidget;

