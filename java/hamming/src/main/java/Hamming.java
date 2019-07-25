class Hamming {

    private final String leftStrand;
    private final String rightStrand;

    Hamming(String left, String right) {
        validate(left.length() > 0 || right.length() == 0,
                "left strand must not be empty.");
        validate(right.length() > 0 || left.length() == 0,
                "right strand must not be empty.");
        validate(left.length() == right.length(),
                "leftStrand and rightStrand must be of equal length.");

        this.leftStrand = left;
        this.rightStrand = right;
    }

    int getHammingDistance() {
        char[]
                l = this.leftStrand.toCharArray(),
                r = this.rightStrand.toCharArray();
        int dist = 0;
        for (int i=0; i<l.length; i++) if (l[i] != r[i]) dist++;
        return dist;
    }

    private static void validate(boolean cond, String msg) {
        if (!cond) throw new IllegalArgumentException(msg);
    }

}
