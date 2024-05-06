import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';
@HiveType(typeId:2)
class DriverData {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String?image;

  @HiveField(2)
  String?name;

  @HiveField(3)
  int?contact;

  @HiveField(4)
  int?experience;

  @HiveField(5)
  String?description;

  DriverData({
     this.id,
     required this.image,
     required this.name,
     required this.contact,
     required this.experience,
     required this.description
  });


}