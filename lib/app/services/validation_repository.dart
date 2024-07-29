import 'package:email_validator/email_validator.dart';
import 'package:salefny/generated/translations.g.dart';

class Validation {
  const Validation._();

  static String? validateFullName(String? value) {
    final regularEnglishName =
        RegExp(r"^\s*([A-Za-z]+(, |[-']| ))+[A-Za-z]+\.?\s*$");
    final regularArabicName = RegExp(
      r"^\s*([\u0600-\u06FF\s]+(, |[-']| ))+[\u0600-\u06FF\s]+\.?\s*$",
    );
    if (value == null || value.isEmpty) {
      return tr.validation.youForgetThisField;
    } else if (!regularArabicName.hasMatch(value) &&
        !regularEnglishName.hasMatch(value)) {
      return tr.validation.atLeast2Words;
    } else {
      return null;
    }
  }

  static bool validateEgpNumber(String value) {
    final regularName = RegExp(r'^1[0125][0-9]{8}$');
    if (regularName.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return tr.validation.youForgetThisField;
    } else if (value.length < 8) {
      return tr.validation.invalidField;
    } else {
      return null;
    }
  }

  static String? validateNewPassword(String? password) {
    if (password == null || password.isEmpty) {
      return tr.validation.youForgetThisField;
    } else if (password.length < 8) {
      return tr.validation.charactersLong;
    } else if (password.toLowerCase() == password) {
      return tr.validation.ThePasswordMustContainAtLeastOneUppercaseLetter;
    } else if (password.toUpperCase() == password) {
      return tr.validation.ThePasswordMustContainAtLeastOneLowercaseLetter;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return tr.validation.youForgetThisField;
    } else if (password.length < 8) {
      return tr.validation.charactersLong;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? password) {
    if (password == null || password.isEmpty) {
      return tr.validation.phoneIsRequired;
    } else if (password.length < 9) {
      return tr.validation.charactersLong;
    } else {
      return null;
    }
  }

  static String? isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return tr.validation.youForgetEmail;
    }
    final bool isValid = EmailValidator.validate(email ?? '');
    if (!isValid) {
      return tr.validation.invalidEmailFormat;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (email == null || email.isEmpty) {
      return tr.validation.emailIsRequired;
    } else if (!regex.hasMatch(email)) {
      return tr.validation.invalidEmailFormat;
    } else {
      return null;
    }
  }

  static String? emptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr.validation.youForgetThisField;
    } else {
      return null;
    }
  }

  static String? isLinkValid(String? link) {
    RegExp regex = RegExp(r'^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$');
    if (link == null || link.isEmpty) {
      return tr.validation.linkIsRequired;
    } else if (!regex.hasMatch(link)) {
      return tr.validation.invalidLinkFormat;
    } else {
      return null;
    }
  }
}


class ValidationRepository {
  String? validateFullName(String? value) {
    final regularEnglishName =
    RegExp(r"^\s*([A-Za-z]+(, |[-']| ))+[A-Za-z]+\.?\s*$");
    final regularArabicName = RegExp(
      r"^\s*([\u0600-\u06FF\s]+(, |[-']| ))+[\u0600-\u06FF\s]+\.?\s*$",
    );
    if (value == null || value.isEmpty) {
      return tr.validation.youForgetThisField;
    } else if (!regularArabicName.hasMatch(value) &&
        !regularEnglishName.hasMatch(value)) {
      return tr.validation.atLeast2Words;
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    final regularName = RegExp(
      r"^[a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+",
    );
    if (value == null || value.isEmpty) {
      return tr.validation.youForgetThisField;
    } else if (!regularName.hasMatch(value)) {
      return tr.validation.invalidField;
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return tr.validation.youForgetThisField;
    } else if (value.length < 8) {
      return tr.validation.invalidField;
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return tr.validation.youForgetThisField;
    if (value.length < 8) return tr.validation.invalidField;
    return null;
  }

  String? validateRePassword(String? password, String? rePassword) {
    if (rePassword == null || rePassword.isEmpty) {
      return tr.validation.youForgetThisField;
    }
    return password != rePassword ? tr.validation.invalidField : null;
  }

  String? hasValue(String? value) {
    if (value == null || value.trim().isEmpty) return tr.validation.youForgetThisField;
    return null;
  }
}

