import { Variable } from 'astal';

export const time = Variable<Date>(new Date()).poll(1000, "date +%s", (d) => new Date(Number(d) * 1000));

