// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<DriverData>> driverlist = ValueNotifier([]);
Future<void> addDetails(DriverData value) async {
  final driverDB = await Hive.openBox<DriverData>('addDetails');
  final id = await driverDB.add(value);
  final driverdata = driverDB.get(id);
  await driverDB.put(
      id,
      DriverData(
        id: id,
          image: driverdata!.image,
          name: driverdata.name,
          contact: driverdata.contact,
          experience: driverdata.experience,
          description: driverdata.description));
  getdrivers();
}

Future<void> getdrivers() async {
  final driverDB = await Hive.openBox<DriverData>('addDetails');
  driverlist.value.clear();
  driverlist.value.addAll(driverDB.values);
  driverlist.notifyListeners();
}

// //to edit product
// Future<void> editDriver(
//   int id,
//   String name,
//   String contact,
//   String imagepath,
//   String description,
// )async {
//   final deptBox = await Hive.openBox<DriverData>('add_driver');
//   final existingDoctor =
//       deptBox.values.firstWhere((driver) => driver.id == id);

//   // ignore: unnecessary_null_comparison
//   if (existingDoctor == null) {
//     //print("no doc");
//   } else {
//     // Update

//     existingDoctor.name = name;
//     existingDoctor.contact = contact;
//     existingDoctor.image = image;
//     existingDoctor.description = description;

//     // Save the updated
//     await deptBox.put(id, existingDoctor);
//     getdrivers();
//   }
// }