import Label, { LabelProps } from "types/widgets/label";

export const Mdl2Label = (props?: LabelProps<unknown, Label<unknown>> | undefined) =>
  Widget.Label({ ...props, className: `${props?.className} mdl2` })
