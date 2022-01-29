class CustomValidator {
  String? _password;
  String? _email;
  String? _userName;
  String? _pin;
  String? _amount;
  String? _phoneNumber;
  String? _address;

  final usernameRegex = RegExp(r"^[A-Za-z0-9]+(?:[_-][A-Za-z0-9]+)*$",
      caseSensitive: false, multiLine: false);
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordRegex = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
  String? get email => _email;
  String? get password => _password;
  String? get userName => _userName;
  String? get amount => _amount;
  String? get pin => _pin;
  String? get phoneNumber => _phoneNumber;
  String? get address => _address;

  String? emailValidator(String? email) {
    if (emailRegex.hasMatch(email ?? "")) {
      _email = email;
      return null;
    }
    return "invalid email";
  }

  String? addressValidator(String address) {
    if (address.trim().length < 10) {
      return 'invalid address';
    }
    _address = address.trim();
    return null;
  }

  String? messageValidator(String message, [String? errorMessage]) {
    if (message.trim().length < 5) {
      return errorMessage ?? 'invalid message';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password!.trim().length < 8) {
      return "minimum of 8 characters";
    }
    _password = password;
    return null;
  }

  String? amountValidator(String input) {
    String trimmedInput = input.trim();
    if (double.tryParse(trimmedInput) == null ||
        (double.tryParse(trimmedInput) ?? 0) <= 0) {
      return "invalid amount";
    }
    _amount = input;
    return null;
  }

  String? pinValidator(String input) {
    if (input.trim().replaceAll(" ", "").length != 4 ||
        int.tryParse(input.trim()) == null) {
      return "invalid";
    }
    _pin = input;
    return null;
  }

  String? pin6Validator(String input) {
    if (input.trim().replaceAll(" ", "").length != 6 ||
        int.tryParse(input.trim()) == null) {
      return "invalid";
    }
    _pin = input;
    return null;
  }

  String? verifyAddress(String input) {
    if (input.trim().length < 10) {
      return "invalid address";
    }
    _address = input;
    return null;
  }

  String? phoneNumberValidator(String input) {
    final parsednumber = int.tryParse(input);
    if (parsednumber == null || input.trim().length != 11) {
      return 'invalid phone number';
    }
    _phoneNumber = input.trim();
    return null;
  }

  String? confirmPasswordValidator(String password) {
    if (password.replaceAll(" ", "").length < 8) {
      return "minimum of 8 characters";
    } else if (password != _password) {
      return "passwords do not match";
    }
    _password = password;
    return null;
  }

  String? userNameValidator(String userName) {
    String resp = userName.replaceAll(" ", "");
    if (resp.length > 3 && usernameRegex.hasMatch(resp)) {
      _userName = resp;
      return null;
    }
    return "invalid username spaces and special characters not allowed";
  }

  String? otpValidator(value) {
    if (value.trim().isEmpty || value.length < 6) {
      return 'Invalid pin';
    }
    return null;
  }

  String? fogortPwdPinValidator(value) {
    if (value.trim().isEmpty || value.length < 4) {
      return 'Invalid pin';
    }
    return null;
  }
}
