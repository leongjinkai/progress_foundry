// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubtractionObjectStruct extends BaseStruct {
  SubtractionObjectStruct({
    List<SubtractionStepsStruct>? subtractionSteps,
  }) : _subtractionSteps = subtractionSteps;

  // "SubtractionSteps" field.
  List<SubtractionStepsStruct>? _subtractionSteps;
  List<SubtractionStepsStruct> get subtractionSteps =>
      _subtractionSteps ?? const [];
  set subtractionSteps(List<SubtractionStepsStruct>? val) =>
      _subtractionSteps = val;

  void updateSubtractionSteps(Function(List<SubtractionStepsStruct>) updateFn) {
    updateFn(_subtractionSteps ??= []);
  }

  bool hasSubtractionSteps() => _subtractionSteps != null;

  static SubtractionObjectStruct fromMap(Map<String, dynamic> data) =>
      SubtractionObjectStruct(
        subtractionSteps: getStructList(
          data['SubtractionSteps'],
          SubtractionStepsStruct.fromMap,
        ),
      );

  static SubtractionObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? SubtractionObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SubtractionSteps': _subtractionSteps?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SubtractionSteps': serializeParam(
          _subtractionSteps,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SubtractionObjectStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SubtractionObjectStruct(
        subtractionSteps: deserializeStructParam<SubtractionStepsStruct>(
          data['SubtractionSteps'],
          ParamType.DataStruct,
          true,
          structBuilder: SubtractionStepsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SubtractionObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SubtractionObjectStruct &&
        listEquality.equals(subtractionSteps, other.subtractionSteps);
  }

  @override
  int get hashCode => const ListEquality().hash([subtractionSteps]);
}

SubtractionObjectStruct createSubtractionObjectStruct() =>
    SubtractionObjectStruct();
