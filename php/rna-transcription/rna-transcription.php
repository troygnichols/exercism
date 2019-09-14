<?php

const DNA_RNA_MAP = [
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
];

function toRna(string $input) : string
{
    return join(
        array_map(
            translate_nucleotide,
            str_split($input)
        )
    );
}

function translate_nucleotide(string $nucleotide) : string
{
    return DNA_RNA_MAP[$nucleotide];
}
