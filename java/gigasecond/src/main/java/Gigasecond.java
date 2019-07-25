import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

class Gigasecond {

    private static final int GIGA = 1_000_000_000;

    private final LocalDateTime moment;

    Gigasecond(LocalDate moment) {
        this(moment.atStartOfDay());
    }

    Gigasecond(LocalDateTime moment) {
        this.moment = moment.plus(GIGA, ChronoUnit.SECONDS);
    }

    LocalDateTime getDateTime() {
      return this.moment;
    }

}
