import type { Widget } from 'astal/gtk3';

export interface CardProps extends Widget.BoxProps {
  variant?: string;
  square?: boolean;
  border?: boolean;
}

export default ({
  children,
  variant = 'surface-100',
  square = false,
  border = true,
  ...rest
}: CardProps) => {
  return (
    <box
      {...rest}
      className={`card card-${variant} ${square && 'card-square'} ${!border && 'card-no-border'}`}
    >
      {children}
    </box>
  );
};
