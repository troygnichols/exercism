class ReverseString {

    String reverse(String in) {
        StringBuilder b = new StringBuilder();
        for (int i=in.length()-1; i >= 0; i--) {
            b.append(in.charAt(i));
        }
        return b.toString();
    }
  
}