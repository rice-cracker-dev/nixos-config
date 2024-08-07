export const opacityHex = (str, opacity) => {
  let hex = Math.trunc(255 * opacity).toString(16);
  if (hex.length <= 1) {
    hex = `0${hex}`;
  }

  return `${hex}${str}`;
};

export const opacityHexHT = (str, opacity) => `#${opacityHex(str, opacity)}`;

export const clamp = (number, min, max) => {
  return Math.max(min, Math.min(number, max));
};

export const getIndexFromPerc = (arr, perc) => {
  const index = clamp(Math.trunc(arr.length * perc), 0, arr.length - 1);
  return index;
};

export const getPercFromMMR = (value, min, max) => {
  const perc = clamp((value - min) / (max - min), 0, 1);
  return perc;
};

export const getIndexFromMMR = (arr, value, min, max) => {
  const perc = getPercFromMMR(value, min, max);
  const index = getValueFromPerc(arr, perc);
  return index;
};
