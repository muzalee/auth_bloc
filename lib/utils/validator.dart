class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_.,-])[A-Za-z\d@$!%*?&_.,-]{8,}$'
  );

  static isValidEmail(String val) {
    return _emailRegExp.hasMatch(val);
  }

  static isValidPassword(String val) {
    return _passwordRegExp.hasMatch(val);
  }
}
