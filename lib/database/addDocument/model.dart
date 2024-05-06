
import 'package:hive/hive.dart';
part 'model.g.dart';


@HiveType(typeId:19)
class Document {
   @HiveField(0)
  int? id;

  @HiveField(1)
  String?pdf;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String?expirationDate;

  Document({
    this.id,
    required this.pdf,
    required this.name,
    required this.expirationDate
  });

}