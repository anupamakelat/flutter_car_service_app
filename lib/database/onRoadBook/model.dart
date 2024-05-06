// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId:8)
class OnRoadData {
  @HiveField(0)
  int?id;

  @HiveField(1)
  String?yourlocation;

  @HiveField(2)
  String?landmark;

  @HiveField(3)
  String?gear;

  @HiveField(4)
  String?model;

  @HiveField(5)
  String?registration_no;

  @HiveField(6)
  String?contact;

  @HiveField(7)
  String?problem;

  OnRoadData({
    this.id,
    required this.yourlocation,
    required this.landmark,
    required this.gear,
    required this.model,
    required this.registration_no,
    required this.contact,
    required this.problem
  });
}