extension Capitalize on String {
  String get toCapitalized {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
