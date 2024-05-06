// ignore_for_file: camel_case_types

import 'package:drive_buddy/common/signup.dart';

class validations {
  static String? nameValidator(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'Enter Your Name';
    }
    final RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z ]*$');

    if (!nameRegExp.hasMatch(trimmedvalue)) {
      return "First letter should be capital";
    }
    return null;
  }
   static String? decValidator(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'Enter the description';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    final trimmedvalue = value?.trim();

    if (trimmedvalue == null || trimmedvalue.isEmpty) {
      return 'Enter your Phone Number';
    }

    final RegExp phoneRegExp =
        RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,5}$');

    if (!phoneRegExp.hasMatch(trimmedvalue)) {
      return 'Enter your Number';
    }
    return null;
  }

  //email
  static String? validateEmail(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'enter your email id';
    }

    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );

    if (!emailRegExp.hasMatch(trimmedValue)) {
      return 'enter valid email';
    }
    return null;
  }
  //expiration date
static String ? validatedateRegExp(String?value){
  final trimmedValue = value?.trim();

  if(trimmedValue==null||trimmedValue.isEmpty){
    return'Re Enter the Date';
  }
  final
    RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');

  if(!dateRegExp.hasMatch(trimmedValue)){
    return'Eg:yyyy\'mm\'dd';
  }
return null;
}

  //createpassword
  static String? validateCreatepassword(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'create a password';
    }
    return null;
  }

  //conformepassword
  static String? validateConformpassword(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Re Enter your password';
    }

    if (trimmedValue != passController.text) {
      return 'Password must watch';
    }

    return null;
  }

  //to validate cannot be empty
static String? validateEmpty(String? value) {
  
  final trimmedValue = value?.trim();

  if (trimmedValue == null || trimmedValue.isEmpty) {
    return 'Cannot be empty';
  }
  return null; 
}



}
