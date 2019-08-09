const alphabetSize = 26;

export const isPangram = (input) => new Set(input.toLowerCase()
  .match(/[a-z]/g)).size == alphabetSize;
