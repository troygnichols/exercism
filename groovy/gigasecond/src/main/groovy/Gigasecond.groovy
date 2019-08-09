import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

class Gigasecond {
  static GIGA = 1000000000

  def add(LocalDate date) {
    add(date.atStartOfDay())
  }

  def add(LocalDateTime moment) {
    moment.plus(GIGA, ChronoUnit.SECONDS)
  }
}
