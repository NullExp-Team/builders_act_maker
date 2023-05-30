import 'package:hive/hive.dart';
part 'document_type.g.dart';

@HiveType(typeId: 3)
enum DocumentType {
  @HiveField(0)
  actOSR,
  @HiveField(1)
  clouseAct,
  @HiveField(2)
  commonInfo,
}
