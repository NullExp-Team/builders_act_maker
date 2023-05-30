import 'package:uuid/uuid.dart';

// Класс для генерации id
const uuid = Uuid();

extension StringX on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
  String decapitalize() => '${this[0].toLowerCase()}${substring(1)}';
}
