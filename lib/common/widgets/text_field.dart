// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String ?labelText;
  final String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
 
  final Function(String)? onChanged;
 
  final validator;

  const CustomTextFormField({
 
   this.labelText,
    this.hintText,
   required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    
    this.onChanged,
    
    this.validator,
  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,controller: controller,obscureText: obscureText,autovalidateMode:AutovalidateMode.onUserInteraction ,
      decoration: InputDecoration(border: UnderlineInputBorder(),hintText: hintText,labelText: labelText),
    );
  }
}




