class Validators {
  static String? validateEmailORMobile(String? value, {bool isEmailId = true}) {
    String emailPattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return "Email can not be empty";
    } else if (!regex.hasMatch(value.trim()) && isEmailId) {
      return "Please enter a valid Email ID";
    } else {
      return null;
    }
  }

  static String? validateName(String? value, String leadText) {
    if (value == null || value.isEmpty) {
      return "$leadText can not be empty";
    } else {
      return null;
    }
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return "OTP field can not be empty";
    } else if (value.length != 4) {
      return "Invalid OTP Number";
    } else {
      return null;
    }
  }

  static String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password should not be empty";
    } else {
      if (!RegExp(r'^.{8,}$').hasMatch(value)) {
        return "Password should be minimum 8 characters";
      } else if (!RegExp('.*[a-z].*').hasMatch(value)) {
        return "Should have atleast one lower character";
      } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
        return "Should have atleast one upper character";
      } else if (!RegExp(".*[0-9].*").hasMatch(value)) {
        return "Should contain atleast one number";
      } else if (!RegExp(".*[!@#&*~\$%_].*").hasMatch(value)) {
        return "Should contain atleast one special character";
      } else {
        return null;
      }
    }
  }

  static String? validateConfirmPassword(
    String? newPassword,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password should not be empty";
    } else {
      if (newPassword == null || newPassword.isEmpty) {
        return null;
      } else if (confirmPassword != newPassword) {
        return "Password doesn't match";
      } else {
        return null;
      }
    }
  }
}
