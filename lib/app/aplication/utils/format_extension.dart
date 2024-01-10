extension FormatExtension on String {
  String get formatAsPhone {
    final phone = replaceAll(RegExp(r'[\D]'), '');
    if (phone.startsWith(RegExp(r'^(55|33|81)'))) {
      return formatWith2DigitLADA(phone);
    } else {
      return phone.replaceAllMapped(
        RegExp(_getGroupingAsRegEx(phone.length)),
        (match) {
          String formattedPhone = match.group(1) ?? '';
          if (match.groupCount >= 2) formattedPhone += '-${match.group(2)}';
          if (match.groupCount == 3) formattedPhone += '-${match.group(3)}';
          return formattedPhone;
        },
      );
    }
  }

  String formatWith2DigitLADA(String input) {
    final phoneNumberFormat = RegExp(r'(\d{1,2})');
    final phoneNumberFormat1 = RegExp(r'(\d{2})(\d{1,4})');
    final phoneNumberFormat2 = RegExp(r'(\d{2})(\d{4})(\d{1,4})');
    if (phoneNumberFormat2.hasMatch(input)) {
      final Iterable<RegExpMatch> matches =
          phoneNumberFormat2.allMatches(input);
      final RegExpMatch match = matches.elementAt(0);
      return '${match.group(1)} ${match.group(2)} ${match.group(3)}';
    }
    if (phoneNumberFormat1.hasMatch(input)) {
      final Iterable<RegExpMatch> matches =
          phoneNumberFormat1.allMatches(input);
      final RegExpMatch match = matches.elementAt(0);
      return '${match.group(1)} ${match.group(2)}';
    }
    if (phoneNumberFormat.hasMatch(input)) {
      final Iterable<RegExpMatch> matches = phoneNumberFormat.allMatches(input);
      final RegExpMatch match = matches.elementAt(0);
      return '${match.group(1)}';
    }
    return input;
  }
}

String _getGroupingAsRegEx(int length) {
  if (length <= 3) return r'(\d{1,3})';
  if (length <= 6) return r'(\d{3})(\d{1,3})';
  return r'(\d{3})(\d{3})(\d{1,4})';
}
