

// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/addDocument/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Document>> doclist = ValueNotifier([]);
Future<void> addDoc( value) async {
  final docDB = await Hive.openBox<Document>('addDoc');
  final id = await docDB.add(value);
  final docdata = docDB.get(id);
  await docDB.put(
      id,
      Document(
        id: id,
          pdf: docdata!.pdf,
          name: docdata.name,
          expirationDate: docdata.expirationDate));
         
  getdr();
}

Future<void> getdr() async {
  final docDB = await Hive.openBox<Document>('addDoc');
  doclist.value.clear();
  doclist.value.addAll(docDB.values);
  // ignore: invalid_use_of_protected_member
  doclist.notifyListeners();
}