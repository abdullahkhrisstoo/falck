class Validatior {
  static String? emailOrPhone(value) {
    if (value == null || value.isEmpty) {
      return 'required';
    } else if (value.length < 10) {
      return 'Enter A valid Data';
    }
    return null;
  }

  static String? usernameVaildator(value) {
    if (value == null || value.isEmpty) {
      return 'required';
    } else if (value.length < 6) {
      return 'enter vaild name';
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value!.isEmpty || value == null) {
      return 'required';
    } else if (value.length < 8) {
      return 'Enter A Correct Password';
    }
    return null;
  }

  static String? phoneValidator(value) {
    if (value!.isEmpty) {
      return 'الرجاء ادخال رقم الهاتف ';
    } else if (value.length < 9) {
      return 'الرجاء التأكد من رقم الهاتف';
    } else {
      return null;
    }
  }

  static String? passwordConfirmationValidator(dynamic value, String password) {
    if (value!.isEmpty) {
      return 'الرجاء ادخال تأكيد كلمة المرور';
    } else if (value != password) {
      return 'الرجاء التأكد من كلمة المرور';
    } else {
      return null;
    }
  }

  static String? emailValidator(value) {
    // Check if this field is empty
    if (value == null || value.isEmpty) {
      return 'الرجاء ادخال البريد الالكتروني';
    }
    // using regular expression
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'الرجاء ادخال البريد الالكتروني بصيغه صحيحة';
    }
    // the email is valid
    return null;
  }
}
