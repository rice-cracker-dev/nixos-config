export const clamp = (value: number, min: number, max: number) => {
  return Math.min(Math.max(value, min), max);
}

export const getIndexFromArrayRange = <T>(array: T[], from: number, to: number, value: number) => {
  const percentage = (value - from) / (to - from);
  
  return Math.round(clamp((array.length - 1) * percentage, 0, array.length - 1));
}

export const getValueFromArrayRange = <T>(array: T[], from: number, to: number, value: number) => {
  return array[getIndexFromArrayRange(array, from, to, value)];
};
