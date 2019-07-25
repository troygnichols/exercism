enum MeetupSchedule {
    FIRST(1),
    SECOND(2),
    THIRD(3),
    FOURTH(4),
    LAST(-1),
    TEENTH(-1);

    private final int value;

    MeetupSchedule(int value) {
        this.value = value;
    }

    int getValue() {
        return value;
    }
}
