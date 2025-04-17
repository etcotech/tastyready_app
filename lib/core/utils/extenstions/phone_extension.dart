
extension HidePhoneNumber on String {
  String hidePhoneNumber() {
    if (length < 4) return this;
    return '${substring(0, length - 4).replaceAll(RegExp(r'\d'), '*')}${substring(length - 4)}';
  }
}