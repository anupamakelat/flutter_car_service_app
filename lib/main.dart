// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/splash.dart';
import 'package:drive_buddy/database/accept/model.dart';
import 'package:drive_buddy/database/acceptDriver/model.dart';
import 'package:drive_buddy/database/addDocument/model.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:drive_buddy/database/bookDetails.dart/model.dart';
import 'package:drive_buddy/database/onRoadBook/model.dart';
import 'package:drive_buddy/database/reject/model.dart';
import 'package:drive_buddy/database/rejectDriver/model.dart';
import 'package:drive_buddy/database/signup/model.dart';
import 'package:hive_flutter/adapters.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.openBox<SignupDetails>('signup_db');
  Hive.openBox<DriverData>('addDetails');
  Hive.openBox<DriverRequest>('addRequest');
  Hive.openBox<OnRoadData>('addinformation');
  Hive.openBox<Document>('addDoc');
  Hive.openBox<AcceptData>('accept');
  Hive.openBox<RejectData>('reject');
  Hive.openBox<AcceptDriver>('addAcceptDri');
  Hive.openBox<RejectDriver>('addRejectDri');
  if (!Hive.isAdapterRegistered(SignupDetailsAdapter().typeId))
    Hive.registerAdapter(SignupDetailsAdapter());

  if (!Hive.isAdapterRegistered(DriverDataAdapter().typeId))
    Hive.registerAdapter(DriverDataAdapter());

  if (!Hive.isAdapterRegistered(DriverRequestAdapter().typeId))
    Hive.registerAdapter(DriverRequestAdapter());

  if(!Hive.isAdapterRegistered(OnRoadDataAdapter().typeId))
    Hive.registerAdapter(OnRoadDataAdapter());

  if(!Hive.isAdapterRegistered(DocumentAdapter().typeId))
    Hive.registerAdapter(DocumentAdapter());

   if(!Hive.isAdapterRegistered(AcceptDataAdapter().typeId))
    Hive.registerAdapter(AcceptDataAdapter());

   if(!Hive.isAdapterRegistered(RejectDataAdapter().typeId))
    Hive.registerAdapter(RejectDataAdapter());

   if(!Hive.isAdapterRegistered(AcceptDriverAdapter().typeId))
    Hive.registerAdapter(AcceptDriverAdapter());

  if(!Hive.isAdapterRegistered(RejectDriverAdapter().typeId))
  Hive.registerAdapter(RejectDriverAdapter());


    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.black),
        color: Color.fromARGB(255, 197, 237, 231)),
        // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 197, 237, 231),),
        useMaterial3: false,
      ),
      home: const MySplash(),
      //changed
      //anu
    );
  }
}








