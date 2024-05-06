// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/reject/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<RejectData>> inflist2 = ValueNotifier([]);
Future<void> addreject(RejectData value) async {
  final rejectDB = await Hive.openBox<RejectData>('reject');
  final id = await rejectDB.add(value);
  final rejectData = rejectDB.get(id);
  await rejectDB.put(
      id,
      RejectData(
          yourlocation: rejectData!.yourlocation,
          landmark: rejectData.landmark,
          gear: rejectData.gear,
          id: id,
          model: rejectData.model,
          registration_no: rejectData.registration_no,
          contact: rejectData.contact,
          problem: rejectData.problem));

  getrsp();
}

Future<void> getrsp() async {
  final rejectDB = await Hive.openBox<RejectData>('reject');
  inflist2.value.clear();
  inflist2.value.addAll(rejectDB.values);
  // ignore: invalid_use_of_protected_member
  inflist2.notifyListeners();
}
