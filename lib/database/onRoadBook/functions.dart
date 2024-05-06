// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/onRoadBook/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<OnRoadData>> inflist = ValueNotifier([]);
Future<void> addinformation(OnRoadData value) async {
  final onroadDB = await Hive.openBox<OnRoadData>('addinformation');
  final id = await onroadDB.add(value);
  final onRoadData = onroadDB.get(id);
  await onroadDB.put(
      id,
      OnRoadData(
          yourlocation: onRoadData!.yourlocation,
          landmark: onRoadData.landmark,
          gear: onRoadData.gear,
          id: id,
          model: onRoadData.model,
          registration_no: onRoadData.registration_no,
          contact: onRoadData.contact,
          problem: onRoadData.problem));

  getinfo();
}

Future<void> getinfo() async {
  final onroadDB = await Hive.openBox<OnRoadData>('addinformation');
  inflist.value.clear();
  inflist.value.addAll(onroadDB.values);
  // ignore: invalid_use_of_protected_member
  inflist.notifyListeners();
}

Future<void>dele( context, int? id)async{
  final remove= await Hive.openBox<OnRoadData>('addinformation');
  remove.delete(id);
  getinfo();
}
