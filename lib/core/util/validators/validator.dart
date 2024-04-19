class Validator {
  //email validator
  static String? validateEmail(String? email) {
    const String emailPattern =
        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';

    final RegExp emailRegex = RegExp(emailPattern);
    if (email == null) {
      return 'Please Enter your email';
    }
    if (email.isEmpty) {
      return 'Please Enter your email';
    }

    if (!emailRegex.hasMatch(email)) {
      return 'Please Enter a valid email';
    }
    return null;
  }

  //password validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }
}
