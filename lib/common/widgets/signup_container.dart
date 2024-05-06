
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/signin.dart';
import 'package:drive_buddy/common/signup.dart';
import 'package:drive_buddy/database/signup/function.dart';
import 'package:drive_buddy/common/widgets/validations.dart';

class signup_container extends StatelessWidget {
  const signup_container({
    super.key,
  });

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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 150),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validations.nameValidator,
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Name', border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 10,
                      validator: validations.validatePhone,
                      controller: phoneController,
                      decoration: InputDecoration(
                          hintText: 'Phone', border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validations.validateEmail,
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email', border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validations.validateCreatepassword,
                      controller: passController,
                      decoration: InputDecoration(
                          hintText: 'Create Passcode',
                          border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validations.validateConformpassword,
                      controller: conformpassController,
                      decoration: InputDecoration(
                          hintText: 'ConformPasscode',
                          border: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 49,
                    ),
                    InkWell(
                      onTap: () {
                        userCheck(emailController.text, context);
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
                            'Sign up',
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
                                  builder: (signin) => const SingIn()),
                              (route) => false);
                        },
                        child: const Text(
                          'I  have an accont ',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
