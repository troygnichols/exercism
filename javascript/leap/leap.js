// on every year that is evenly divisible by 4
//   except every year that is evenly divisible by 100
//     unless the year is also evenly divisible by 400

const divisibleBy = (dividend, divisor) => dividend % divisor == 0;

export const isLeap = (year) => {
  return divisibleBy(year, 4) &&
    !(
      divisibleBy(year, 100) &&
      !divisibleBy(year, 400)
    );
};
