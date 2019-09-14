const range = n => [...Array(n).keys()];

const extractColumnValue = (index) =>
      (row) => row[index];

export class Matrix {

  constructor(rawInput) {
    this.rawInput = rawInput;
  }

  get rows() {
    return this.rawInput.split("\n").map(
      rowstr => rowstr.split(' ').map(Number));
  }

  get columns() {
    return range(this.width)
      .map(rowIndex =>
           this.rows.map(
             extractColumnValue(rowIndex)));
  }

  get width() {
    return Math.max(
      ...this.rows.map(row => row.length));
  }
}
