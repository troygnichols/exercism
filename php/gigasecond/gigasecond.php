<?php
define("GIGA", 1000000000);

function from(DateTimeImmutable $moment): DateTimeImmutable
{
    return new DateTimeImmutable("@" . ($moment->getTimeStamp() + GIGA));
}
