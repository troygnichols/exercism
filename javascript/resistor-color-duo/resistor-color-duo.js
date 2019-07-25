export const value = (colors) => {
  return parseInt(
    colors.reduce(
      (acc, color) => acc + COLORS.indexOf(color),
      ""
    )
  );
};

export const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
];
