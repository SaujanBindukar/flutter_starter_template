class Validators {
  Validators._();

  static String? emailValidator(String? email) {
    final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    if (!emailRegex.hasMatch(email)) {
      return 'Enter valid email';
    }

    return null;
  }

  static String? requiredFieldValidators(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill the field';
    }
    return null;
  }

  static String? passwordValidators(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
