String? validatorForName(String? text, {required int maxVal, required int minVal}) {
  if (text == null || text.isEmpty) {
    return "This field shouldn't be empty";
  }
  if (text.length > maxVal) {
    return "This field must not exceed $maxVal characters";
  }
  if (text.length < minVal) {
    return "This field must be at least $minVal characters long";
  }
  return null;
}
String? validatorForEmail(String? text, {required int maxVal, required int minVal}) {
  if (text == null || text.isEmpty) {
    return "This field shouldn't be empty";
  }
  final bool emailValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(text);
  if (!emailValid) {
    return "Please enter a valid email";
  }
  if (text.length > maxVal) {
    return "Email must not exceed $maxVal characters";
  }
  if (text.length < minVal) {
    return "Email must be at least $minVal characters long";
  }
  return null;
}
String? validatorForPassword(String? text, {required int maxVal, required int minVal}) {
  if (text == null || text.isEmpty) {
    return "This field shouldn't be empty";
  }
  if (text.length > maxVal) {
    return "This field must not exceed $maxVal characters";
  }
  if (text.length < minVal) {
    return "This field must be at least $minVal characters long";
  }
  return null;
}