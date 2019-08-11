const range = n => [...Array(n).keys()];

export class Matrix {

  constructor(rawInput) {
    this.rawInput = rawInput;
  }

  get rows() {
    return this.lines.map(rowstr =>
      rowstr.split(' ')
      .map(numstr => parseInt(numstr))
    );
  }

  get columns() {
    return range(this.width)
      .map(i => this.rows.map(row => row[i]))
  }

  get lines() {
    return this.rawInput.split('\n');
  }

  get width() {
    return this.rows
      .reduce((acc, row) => Math.max(acc, row.length), 0);
  }
}
