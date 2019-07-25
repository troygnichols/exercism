function isLeapYear(year: number): boolean {
  return isDivBy(year, 4) && (!isDivBy(year, 100) || isDivBy(year, 400))
}

function isDivBy(n: number, m: number): boolean {
  return n % m === 0
}

export default isLeapYear
