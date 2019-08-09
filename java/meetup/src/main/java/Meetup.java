import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.stream.IntStream;

public class Meetup {

  private final LocalDate firstDayOfMonth;

  public Meetup(int month, int year) {
    this.firstDayOfMonth = LocalDate.of(year, month, 1);
  }

  /**
   * Get the date for a meetup, given the day of week and meetup type.
   */
  public LocalDate day(DayOfWeek dow, MeetupSchedule sched) {
    switch (sched) {
      case LAST:
        return firstDayOfMonth.with(
                TemporalAdjusters.lastInMonth(dow));

      case TEENTH:
        return findTeenth(dow);

      default:
        return firstDayOfMonth.with(
                TemporalAdjusters.dayOfWeekInMonth(sched.getValue(), dow));
    }
  }

  private LocalDate findTeenth(DayOfWeek dow) {
    return IntStream.rangeClosed(13, 19)
            .mapToObj(this.firstDayOfMonth::withDayOfMonth)
            .filter(d -> d.getDayOfWeek() == dow)
            .findFirst()
            .orElseThrow(RuntimeException::new);
  }
}
