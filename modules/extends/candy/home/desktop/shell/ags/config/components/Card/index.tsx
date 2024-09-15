import type { Binding, Widget } from 'astal';

export interface CardProps extends Widget.BoxProps {
  variant?: string;
  square?: boolean;
}

export default ({
  children,
  variant = 'surface-100',
  square = false,
  ...rest
}: CardProps) => {
  return (
    <box
      {...rest}
      className={`card card-${variant} ${square && 'card-square'}`}
    >
      {children}
    </box>
  );
};
