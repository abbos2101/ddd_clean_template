/// String case conversion utilities
///
/// Provides methods to convert strings between different naming conventions:
/// - camelCase
/// - PascalCase
/// - snake_case
/// - kebab-case
/// - SCREAMING_SNAKE_CASE
extension StringCaseExtension on String {
  /// Converts string to camelCase
  ///
  /// Example: "hello_world" -> "helloWorld"
  String toCamelCase() {
    if (isEmpty) {
      return this;
    }

    final words = _splitIntoWords();
    if (words.isEmpty) {
      return this;
    }

    final first = words.first.toLowerCase();
    final rest = words.skip(1).map((word) => _capitalize(word.toLowerCase()));

    return [first, ...rest].join();
  }

  /// Converts string to PascalCase
  ///
  /// Example: "hello_world" -> "HelloWorld"
  String toPascalCase() {
    if (isEmpty) {
      return this;
    }

    final words = _splitIntoWords();
    return words.map((word) => _capitalize(word.toLowerCase())).join();
  }

  /// Converts string to snake_case
  ///
  /// Example: "HelloWorld" -> "hello_world"
  String toSnakeCase() {
    if (isEmpty) {
      return this;
    }

    final words = _splitIntoWords();
    return words.map((word) => word.toLowerCase()).join('_');
  }

  /// Converts string to kebab-case
  ///
  /// Example: "HelloWorld" -> "hello-world"
  String toKebabCase() {
    if (isEmpty) {
      return this;
    }

    final words = _splitIntoWords();
    return words.map((word) => word.toLowerCase()).join('-');
  }

  /// Converts string to SCREAMING_SNAKE_CASE
  ///
  /// Example: "HelloWorld" -> "HELLO_WORLD"
  String toScreamingSnakeCase() {
    if (isEmpty) {
      return this;
    }

    final words = _splitIntoWords();
    return words.map((word) => word.toUpperCase()).join('_');
  }

  /// Converts string to Title Case
  ///
  /// Example: "hello world" -> "Hello World"
  String toTitleCase() {
    if (isEmpty) {
      return this;
    }

    final words = _splitIntoWords();
    return words.map((word) => _capitalize(word.toLowerCase())).join(' ');
  }

  /// Converts string to dot.case
  ///
  /// Example: "HelloWorld" -> "hello.world"
  String toDotCase() {
    if (isEmpty) {
      return this;
    }

    final words = _splitIntoWords();
    return words.map((word) => word.toLowerCase()).join('.');
  }

  /// Helper method to split string into words
  List<String> _splitIntoWords() {
    if (isEmpty) {
      return [];
    }

    // Handle different separators: spaces, underscores, hyphens, dots
    var normalized = replaceAll(RegExp(r'[-_.\s]+'), ' ');

    // Split camelCase and PascalCase
    normalized = normalized.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );

    // Split sequences of uppercase letters followed by lowercase
    normalized = normalized.replaceAllMapped(
      RegExp(r'([A-Z]+)([A-Z][a-z])'),
      (match) =>
          '${match.group(1)!.substring(0, match.group(1)!.length - 1)} ${match.group(1)!.substring(match.group(1)!.length - 1)}${match.group(2)!.substring(1)}',
    );

    return normalized
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
  }

  /// Helper method to capitalize first letter
  String _capitalize(String word) {
    if (word.isEmpty) {
      return word;
    }
    return word[0].toUpperCase() + word.substring(1);
  }

  /// Checks if string is in camelCase format
  bool get isCamelCase {
    if (isEmpty) {
      return false;
    }
    return RegExp(r'^[a-z][a-zA-Z0-9]*$').hasMatch(this) &&
        contains(RegExp(r'[A-Z]'));
  }

  /// Checks if string is in PascalCase format
  bool get isPascalCase {
    if (isEmpty) {
      return false;
    }
    return RegExp(r'^[A-Z][a-zA-Z0-9]*$').hasMatch(this);
  }

  /// Checks if string is in snake_case format
  bool get isSnakeCase {
    if (isEmpty) {
      return false;
    }
    return RegExp(r'^[a-z0-9]+(_[a-z0-9]+)*$').hasMatch(this);
  }

  /// Checks if string is in kebab-case format
  bool get isKebabCase {
    if (isEmpty) {
      return false;
    }
    return RegExp(r'^[a-z0-9]+(-[a-z0-9]+)*$').hasMatch(this);
  }

  /// Checks if string is in SCREAMING_SNAKE_CASE format
  bool get isScreamingSnakeCase {
    if (isEmpty) {
      return false;
    }
    return RegExp(r'^[A-Z0-9]+(_[A-Z0-9]+)*$').hasMatch(this);
  }
}
