class Validation {
  static final validCharacters = RegExp(r"^[a-zA-Z0-9]+$");
  static final validEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z][a-zA-Z]+");

  static bool validatePassword(password) {
    if (password.length > 5 && validCharacters.hasMatch(password)) {
      return true;
    } else
      return false;
  }

  static bool validateEmail(email) {
    if (email.length > 5 && validEmail.hasMatch(email)) {
      return true;
    } else
      return false;
  }

  static bool validateUsername(username) {
    if (username.length > 5 && validCharacters.hasMatch(username)) {
      return true;
    } else
      return false;
  }
}
