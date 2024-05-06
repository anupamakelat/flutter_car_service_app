// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/signin.dart';
import 'package:drive_buddy/common/signup.dart';
import 'package:drive_buddy/database/signup/model.dart';

import 'package:hive/hive.dart';

ValueNotifier<List<SignupDetails>> signuplist=ValueNotifier([]);

Future<void>addSignup(SignupDetails value)async{
  final signupDB = await Hive.openBox<SignupDetails>('signup_db');
  final signup = await signupDB.add(value);
  value .id = signup;
  signuplist.value.add(value);
  signuplist.notifyListeners();
  //print("this is the value :$value");
  getuser();
}

Future<void> getuser() async {
  final signupDB = await Hive.openBox<SignupDetails>('signup_db');
  signuplist.value.clear();
  signuplist.value.addAll(signupDB.values);
  signuplist.notifyListeners();
}


//user Check
void userCheck(String email,context) async {
    await Hive.openBox<SignupDetails>('signup_db');
    final signupDB = Hive.box<SignupDetails>('signup_db');
    final signupExists = signupDB.values.any((user) => user.email == email);

    if (signupExists) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('error'),
              content: const Text('User alredy exists'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('ok'))
              ],
            );
          });
    } else {
      signupButton(context);
    }
  }

  Future<void> signupButton(context) async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final createpassword = passController.text.trim();
    final conformpassword = conformpassController.text.trim();

    if (formkey.currentState!.validate() &&
        name.isNotEmpty &&
        phone.isNotEmpty &&
        email.isNotEmpty &&
        createpassword.isNotEmpty &&
        conformpassword.isNotEmpty &&
        passController.text == conformpassController.text) {
      final _user = SignupDetails(
          name: name,
          phone: phone,
          email: email,
          createpassword: createpassword,
          conformpassword: conformpassword);
      addSignup(_user);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SingIn()));
    } else {
      nameController.clear();
      phoneController.clear();
      emailController.clear();
    }
  }