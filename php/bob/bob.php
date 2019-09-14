<?php

class Bob
{
    public function respondTo(string $input) : string
    {
        $input = trim($input);

        switch (true) {
            case Bob::isBlank($input):
                return 'Fine. Be that way!';
            case Bob::isYelling($input) && Bob::isQuestion($input):
                return 'Calm down, I know what I\'m doing!';
            case Bob::isYelling($input):
                return 'Whoa, chill out!';
            case Bob::isQuestion($input):
                return 'Sure.';
            default:
                return "Whatever.";
        }
    }

    private static function isBlank(string $input): bool
    {
        return strlen($input) === 0;
    }

    private static function isYelling(string $input): bool
    {
        return Bob::hasLetters($input) && Bob::isUpper($input);
    }

    private static function isQuestion(string $input): bool
    {
        return substr($input, -1) === '?';
    }

    private static function hasLetters(string $input): bool
    {
        return strtoupper($input) != strtolower($input);
    }

    private static function isUpper(string $input): bool
    {
        return strtoupper($input) === $input;
    }
}
