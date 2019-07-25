const MAP = {
 'G': 'C',
 'C': 'G',
 'T': 'A',
 'A': 'U'
};

const translate = (nucleotide) => MAP[nucleotide]

export const toRna = (dna) => dna.split('').map(translate).join('');
