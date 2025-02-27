// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionObjectStruct extends BaseStruct {
  AdditionObjectStruct({
    AdditionStepsStruct? additionSteps,
  }) : _additionSteps = additionSteps;

  // "AdditionSteps" field.
  AdditionStepsStruct? _additionSteps;
  AdditionStepsStruct get additionSteps =>
      _additionSteps ?? AdditionStepsStruct();
  set additionSteps(AdditionStepsStruct? val) => _additionSteps = val;

  void updateAdditionSteps(Function(AdditionStepsStruct) updateFn) {
    updateFn(_additionSteps ??= AdditionStepsStruct());
  }

  bool hasAdditionSteps() => _additionSteps != null;

  static AdditionObjectStruct fromMap(Map<String, dynamic> data) =>
      AdditionObjectStruct(
        additionSteps: data['AdditionSteps'] is AdditionStepsStruct
            ? data['AdditionSteps']
            : AdditionStepsStruct.maybeFromMap(data['AdditionSteps']),
      );

  static AdditionObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? AdditionObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'AdditionSteps': _additionSteps?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AdditionSteps': serializeParam(
          _additionSteps,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AdditionObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdditionObjectStruct(
        additionSteps: deserializeStructParam(
          data['AdditionSteps'],
          ParamType.DataStruct,
          false,
          structBuilder: AdditionStepsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AdditionObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionObjectStruct &&
        additionSteps == other.additionSteps;
  }

  @override
  int get hashCode => const ListEquality().hash([additionSteps]);
}

AdditionObjectStruct createAdditionObjectStruct({
  AdditionStepsStruct? additionSteps,
}) =>
    AdditionObjectStruct(
      additionSteps: additionSteps ?? AdditionStepsStruct(),
    );
