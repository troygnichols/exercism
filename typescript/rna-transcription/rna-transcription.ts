class Transcriptor {
    map: Map<string, string>

    constructor() {
      this.map = new Map([
        ['G', 'C'],
        ['C', 'G'],
        ['T', 'A'],
        ['A', 'U']
      ])
    }

    toRna(dna: string): string {
      return [...dna].map( (nucleotide: string) => {
        return this.transform(nucleotide)
      }).join('')
    }

    transform(nucleotide: string): string {
      const rna = this.map.get(nucleotide)
      if (rna === undefined) {
        throw new Error('Invalid input DNA.')
      }
      return rna
    }
}

export default Transcriptor
