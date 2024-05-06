import 'package:hive/hive.dart';
part'model.g.dart';
@HiveType(typeId:1)
class SignupDetails{
  @HiveField(0)
  int?id;
  @HiveField(1)
  String name;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String email;

  @HiveField(4)
  String createpassword;

  @HiveField(5)
  String conformpassword;

  SignupDetails({
     this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.createpassword,
    required this.conformpassword
  });


}