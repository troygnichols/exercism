class Twofer {
  String twofer(String name) {
    if (null == name || name.length() == 0) {
      name = "you";
    }
    return "One for " + name + ", one for me.";
  }
}
