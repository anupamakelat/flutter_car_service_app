// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void showSnackbar(BuildContext context,String message,Color color){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
  duration: Duration(seconds: 3),
  backgroundColor: color,));
}