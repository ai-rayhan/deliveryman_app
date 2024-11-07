
String getNumberwithoutCountryCode(String phoneNumber) {
  RegExp regExp = RegExp(r'^\+?\d{1,4}');
  String cleanedNumber = phoneNumber.replaceAll(regExp, '');
  return cleanedNumber.trim();
}

String getCountryCode(String phoneNumber) {
  RegExp regExp = RegExp(r'^(\+?\d{1,4})');
  Match? match = regExp.firstMatch(phoneNumber);
  if (match != null) {
    return match.group(1) ?? '';
  }
  return ''; 
}
