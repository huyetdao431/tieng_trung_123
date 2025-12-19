class Helper {
  final String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final String passwordPattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  final String phoneRegex = r'^\+?[0-9]{7,15}$';

  bool isEmailAddress({required String email}) {
    if (RegExp(emailRegex).hasMatch(email.trim())) {
      return true;
    }
    return false;
  }

  bool isPassword({required String password}) {
    if (RegExp(passwordPattern).hasMatch(password.trim())) {
      return true;
    }
    return false;
  }

  bool isPhoneNumber({required String phoneNumber}) {
    if (RegExp(phoneRegex).hasMatch(phoneNumber.trim())) {
      return true;
    }
    return false;
  }

  bool isPasswordMatch({required String oldPassword, required String newPassword}) {
    if (oldPassword.compareTo(newPassword) == 0) {
      return true;
    }
    return false;
  }
}
