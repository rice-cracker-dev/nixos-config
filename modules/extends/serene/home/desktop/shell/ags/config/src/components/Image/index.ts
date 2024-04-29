import type { BoxProps } from "types/widgets/box";

const Image = (params: {
  src: string;
  width: number;
  height: number;
}, props?: BoxProps) => {
  return Widget.Box({
    ...props,
    css: `
      background-image: url('${params.src}');
      background-size: 100%;
      background-position: center;
      background-repeat: no-repeat;
      min-width: ${params.width}px;
      min-height: ${params.height}px;
    `,
  });
};

export default Image;

