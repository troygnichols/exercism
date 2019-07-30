class Isogram {
  static boolean isIsogram(String phrase) {
    def chars = phrase.toLowerCase().findAll("\\w")
    chars.toUnique().size() == chars.size()
  }
}
