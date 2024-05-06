import 'package:hive/hive.dart';
part 'model.g.dart';
@HiveType(typeId:3)
class DriverRequest{
 @HiveField(0)
  int?id;
  @HiveField(1)
  String ?name;

  @HiveField(2)
  String ?phone;

  @HiveField(3)
  String ?image;

  @HiveField(4)
  String? pickuplocation;

  @HiveField(5)
  String?gear;

  @HiveField(6)
  String?model;

  @HiveField(7)
  String?pickuptime;

  @HiveField(8)
  String?estimatetime;

  @HiveField(9)
  bool ?accept;

  @HiveField(10)
  bool?reject;

  @HiveField(11)
  String? userphn;

  @HiveField(12)
  String ? username;


  DriverRequest({
     this.id,
     required this.username,
     required this.userphn,
    required this.name,
    required this.phone,
    required this.image,
    required this.pickuplocation,
    required this.gear,
    required this.model,
    required this.pickuptime,
    required this.estimatetime,
    this.accept,
    this.reject
  });

}