extension Convert on int {
  String toReadable() {
    // 1234 -> 1,234
    // 12345 -> 12,345

    final numStr = toString();
    final buffer = StringBuffer();

    for (int i = 0; i < numStr.length; i++) {
      if (i > 0 && (numStr.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(numStr[i]);
    }

    return buffer.toString();
  }
}
