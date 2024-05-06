// ignore_for_file: no_leading_underscores_for_local_identifiers, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

import 'package:drive_buddy/database/rejectDriver/model.dart';

import 'package:hive/hive.dart';

ValueNotifier<List<RejectDriver>> requestrejectlist = ValueNotifier([]);
Future<void> addReques(RejectDriver value) async {
  final requestDB1 = await Hive.openBox<RejectDriver>('addRejectDri');
  final id = await requestDB1.add(value);
  final requestdata = requestDB1.get(id);
  await requestDB1.put(
      id,
      RejectDriver(
          id: id,
          username: requestdata!.username,
          accept: requestdata.accept,
          reject: requestdata.reject,
          userphn: requestdata.userphn,
          name: requestdata.name,
          phone: requestdata.phone,
          image: requestdata.image,
          pickuplocation: requestdata.pickuplocation,
          gear: requestdata.gear,
          model: requestdata.model,
          pickuptime: requestdata.pickuptime,
          estimatetime: requestdata.estimatetime));
  getrejRequest();
}

Future<void> getrejRequest() async {
  final request = await Hive.openBox<RejectDriver>('addRejectDri');
   requestrejectlist.value.clear();
  requestrejectlist.value.addAll(request.values);
  // ignore: invalid_use_of_protected_member
  requestrejectlist.notifyListeners();
}

// Future<void> addReq(context,
//     {required String? pickup,
//     required String? gear,
//     required String? model,
//     required String? time,
//     required String? estimatetym,
//     required DriverData? data,
//     required SignupDetails? currentUser}) async {
//   final _addvalue =RejectDriver(
//       id: -1,
//       accept: false,
//       reject: false,
//       username: currentUser?.name,
//       userphn: currentUser?.phone,
//       name: data?.name,
//       phone: data!.contact.toString(),
//       image: data.image,
//       pickuplocation: pickup,
//       gear: gear,
//       model: model,
//       pickuptime: time,
//       estimatetime: estimatetym);
//       addReques(_addvalue);
//         showSnackbar(context, 'Succesfull', Colors.green);
        
//           Navigator.pop(context);
// }
