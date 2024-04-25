/// This extension adds the ability to capitalize the first letter of a string.
extension StringExtension on String {
  String get capitalizeFirst => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
