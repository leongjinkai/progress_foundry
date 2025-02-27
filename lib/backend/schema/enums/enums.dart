import 'package:collection/collection.dart';

enum NumberProblemType {
  longAddition,
  longDivision,
}

enum QnType {
  Addition,
  Subtraction,
  Multiplication,
  Division,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (NumberProblemType):
      return NumberProblemType.values.deserialize(value) as T?;
    case (QnType):
      return QnType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
