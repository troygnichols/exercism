const GIGA = 1000000000;

const GIGA_MILLIS = GIGA * 1000;

export const gigasecond = (date) => {
  return new Date(date.getTime() + GIGA_MILLIS);
};
