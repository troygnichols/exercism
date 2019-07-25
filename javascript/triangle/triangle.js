export class Triangle {
  constructor(...sides) {
    this.sides = sides;
  }

  kind() {
    this.validateTriangle();

    if (this.isEquilateral()) { return 'equilateral'; }
    if (this.isIsosceles()) { return 'isosceles'; }
    if (this.isScalene()) { return 'scalene'; }
    throw new Error("Could not determine triangle type :(");
  }

  isEquilateral() {
    let [a,b,c] = this.sides;
    return a === b && a === c;
  }

  isIsosceles() {
    const [a,b] = this.sortedSides();
    return a === b;
  }

  isScalene() {
    const [a,b,c] = this.sides;
    return a !== b && a !== c && b !== c;
  }

  sortedSides() {
    return this.sides.slice(0).sort((a,b) => b - a);
  }

  validateTriangle() {
    this.validateNoZeroSides();
    this.validateTriangleInequality();
  }

  validateNoZeroSides() {
    if (Math.min(...this.sides) <= 0) {
      throw new Error("Sides cannot be zero");
    }
  }

  validateTriangleInequality() {
    const [longest, ...rest] = this.sortedSides();
    const sum = rest.reduce((acc, n) => n + acc);
    if (sum <= longest) {
      throw new Error("This is a degenerate triangle. Illegal!");
    }
  }
}
