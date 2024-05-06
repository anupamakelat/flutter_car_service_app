// ignore_for_file: no_leading_underscores_for_local_identifiers, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:drive_buddy/common/widgets/snackBar.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:drive_buddy/database/bookDetails.dart/model.dart';
import 'package:drive_buddy/database/signup/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<DriverRequest>> requestlist = ValueNotifier([]);
Future<void> addRequest( value) async {
  final requestDB = await Hive.openBox<DriverRequest>('addRequest');
  final id = await requestDB.add(value);
  final requestdata = requestDB.get(id);
  await requestDB.put(
      id,
      DriverRequest(
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
  getRequest();
}

Future<void> getRequest() async {
  final request = await Hive.openBox<DriverRequest>('addRequest');
   requestlist.value.clear();
  requestlist.value.addAll(request.values);
  requestlist.notifyListeners();
}

Future<void> addReq(context,
    {required String? pickup,
    required String? gear,
    required String? model,
    required String? time,
    required String? estimatetym,
    required DriverData? data,
    required SignupDetails? currentUser}) async {
  final _addvalue = DriverRequest(
      id: -1,
      accept: false,
      reject: false,
      username: currentUser?.name,
      userphn: currentUser?.phone,
      name: data?.name,
      phone: data!.contact.toString(),
      image: data.image,
      pickuplocation: pickup,
      gear: gear,
      model: model,
      pickuptime: time,
      estimatetime: estimatetym);
      addRequest(_addvalue);
        showSnackbar(context, 'Succesfull', Colors.green);
        
          Navigator.pop(context);
}
