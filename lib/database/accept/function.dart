// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/cupertino.dart';
import 'package:drive_buddy/database/accept/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<AcceptData>>inflist1 = ValueNotifier([]);
Future<void> addaccept(AcceptData value) async {
  final acceptDB = await Hive.openBox<AcceptData>('accept');
  final id = await acceptDB .add(value);
  final acceptData  = acceptDB .get(id);
  await acceptDB .put(
      id,
      AcceptData(
          yourlocation: acceptData !.yourlocation,
          landmark: acceptData .landmark,
          gear: acceptData .gear,
          id: id,
          model: acceptData.model,
          registration_no: acceptData.registration_no,
          contact: acceptData.contact,
          problem: acceptData.problem));
          


          

  getasp();
}

Future<void> getasp() async {
  final onroadDB = await Hive.openBox<AcceptData>('accept');
  inflist1.value.clear();
  inflist1.value.addAll(onroadDB.values);
  // ignore: invalid_use_of_protected_member
  inflist1.notifyListeners();
  
}
