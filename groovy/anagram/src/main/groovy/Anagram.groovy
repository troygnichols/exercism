class Anagram {
  String subject

  Anagram(String subject) {
    this.subject = subject
  }

  def find(List<String> candidates) {
    candidates.findAll { isAnagram(it) }
  }

  def isAnagram(candidate) {
    !candidate.equalsIgnoreCase(this.subject) &&
      getSortedChars(candidate) == getSortedChars(this.subject)
  }

  static List<String> getSortedChars(String word) {
    word.toLowerCase().toList().sort()
  }
}
