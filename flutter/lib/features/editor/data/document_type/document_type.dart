enum DocumentType {
  actOSR('Акт ОСР'),
  clouseAct('Акт закрытия'),
  commonInfo('Общая информация');

  final String label;

  const DocumentType(this.label);

  bool get isActOSR => this == DocumentType.actOSR;
  bool get isClouseAct => this == DocumentType.clouseAct;
  bool get isCommonInfo => this == DocumentType.commonInfo;
}
