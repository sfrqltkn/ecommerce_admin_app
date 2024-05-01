class MyValidators {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "Display name cannot be empty";
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return "Display name must be beetween 3 and 20 characters";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter an email";
    } else if (!RegExp(r'^[a-zA-Z0-9._+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter an password";
    } else if (value.length < 6) {
      return "Password must be least 6 characters";
    }
    return null;
  }


   static String? repeatPasswordValidator(String? value,String? password) {
    if (value!=password) {
      return "Please enter an password";
    }
    return null;
  }
  
}
