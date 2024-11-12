import type { Binding } from 'astal';

export type NullableBindableProperty<T> = T | null | Binding<T | null>;
