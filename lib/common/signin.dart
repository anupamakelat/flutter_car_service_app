// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/adhome.dart';
import 'package:drive_buddy/common/signup.dart';
import 'package:drive_buddy/common/widgets/bottomnav.dart';
import 'package:drive_buddy/database/signup/model.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'saveUser';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 146, 236, 241),
            Color.fromARGB(255, 251, 251, 251)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateEmail,
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email', border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateCreatepassword,
                      controller: passController,
                      decoration: InputDecoration(
                          hintText: 'Create Passcode',
                          border: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 49,
                    ),
                    InkWell(
                      onTap: () {
                        submit();
                      },
                      child: Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 227, 225, 219)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (signup) => const SingUp()),
                              (route) => false);
                        },
                        child: const Text(
                          'I don\'t have an accont ',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }

  String? validateEmail(String? value) {
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

  String? validateCreatepassword(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'create a password';
    }
    return null;
  }

  void submit() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      if (emailController.text == 'admin@gmail.com' &&
          passController.text == 'admin123') {
        Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (adhome)=> ADhome()), (route) => false);
      } else {
        login(emailController.text, passController.text, context);
      }
    }
  }

  //to login
  void login(String email, String password, BuildContext context) async {
    final signupDB = await Hive.openBox<SignupDetails>('signup_db');

    SignupDetails? signup;

    for (var i = 0; i < signupDB.length; i++) {
      final currentUser = signupDB.getAt(i);
            if (currentUser?.email == email &&
          currentUser?.conformpassword == password) {
        signup = currentUser;
        break;
      }
    }

    if (signup != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(SAVE_KEY_NAME, true);
      await saveUserEmail(email);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (home) => MyNav()), (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('invalid email or password'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('ok'))
              ],
            );
          });
    }
  }

  //set a current user
  Future<void> saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUser', email);
  }
}
