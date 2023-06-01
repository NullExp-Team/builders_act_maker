import 'package:hive/hive.dart';
part 'document_type.g.dart';

@HiveType(typeId: 3)
enum DocumentType {
  @HiveField(0)
  actOSR('Акт ОСР'),
  @HiveField(1)
  clouseAct('Акт закрытия'),
  @HiveField(2)
  commonInfo('Общая информация');

  final String label;

  const DocumentType(this.label);

  static final List<DocumentType> availableValues =
      values.where((e) => e != commonInfo).toList();

  bool get isActOSR => this == actOSR;
  bool get isClouseAct => this == clouseAct;
  bool get isCommonInfo => this == commonInfo;
}
