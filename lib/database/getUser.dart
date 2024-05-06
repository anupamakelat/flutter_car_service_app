// ignore_for_file: file_names
// import 'dart:ffi';

// import 'package:flutter_car_service_app/database/signup/model.dart';
// import 'package:hive/hive.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//   SignupDetails?currentUser;
// Future<void>getUser()async{

//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   var userEmail=prefs.getString('currentUser');

//   final useBox =await Hive.openBox<SignupDetails>('signup_dp');
//   currentUser =useBox.values.firstWhere((user)=>user.email==userEmail,);
  
// }