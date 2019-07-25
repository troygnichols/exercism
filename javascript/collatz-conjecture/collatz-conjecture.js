//
// This is only a SKELETON file for the 'Collatz Conjecture' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

// recursive
export const steps = (n, count = 0) => {
  if (n <= 0) {
    throw new Error('Only positive numbers are allowed');
  }
  if (n === 1) {
    return count;
  }
  if (isEven(n)) {
    return steps(n/2, count + 1)
  } else {
    return steps((3*n)+1, count + 1)
  }
};

// non-recursive
// export const steps = (n) => {
//   if (n <= 0) {
//     throw new Error('Only positive numbers are allowed');
//   }
//
//   let count;
//   for(count=0; n!==1; count++) {
//     if (isEven(n)) {
//       n = n/2;
//     } else {
//       n = (3*n)+1;
//     }
//   }
//
//   return count;
// }

export const isEven = (n) => {
  return n % 2 === 0;
}
