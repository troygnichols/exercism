<?php

function distance(string $strandA, string $strandB): int
{
    $len = strlen($strandA);
    if ($len != strlen($strandB)) {
        throw new InvalidArgumentException('DNA strands must be of equal length.');
    }

    $distance = 0;

    for ($i = 0; $i < $len; $i++) {
        if ($strandA[$i] != $strandB[$i]) {
            $distance++;
        }
    }

    return $distance;
}
