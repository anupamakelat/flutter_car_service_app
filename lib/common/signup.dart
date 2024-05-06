// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:drive_buddy/common/widgets/signup_container.dart';

TextEditingController passController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController conformpassController = TextEditingController();
TextEditingController phoneController = TextEditingController();
final formkey = GlobalKey<FormState>();

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return signup_container();
  }
}
