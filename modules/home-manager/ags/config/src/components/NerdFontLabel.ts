import Label, { LabelProps } from "types/widgets/label";

export const NerdFontLabel = (props?: LabelProps<unknown, Label<unknown>> | undefined) =>
  Widget.Label({ ...props, className: `${props?.className} nerdfont` })
