using System;

public static class Leap
{
    public static bool IsLeapYear(int year) =>
      isDivBy(year, 4) && (!isDivBy(year, 100) || isDivBy(year, 400));

    private static bool isDivBy(int n, int divisor) => n % divisor == 0;
}
