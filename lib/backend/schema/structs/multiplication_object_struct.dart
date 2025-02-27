// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultiplicationObjectStruct extends BaseStruct {
  MultiplicationObjectStruct({
    List<MultiplicationStepsStruct>? multiplicationSteps,
  }) : _multiplicationSteps = multiplicationSteps;

  // "MultiplicationSteps" field.
  List<MultiplicationStepsStruct>? _multiplicationSteps;
  List<MultiplicationStepsStruct> get multiplicationSteps =>
      _multiplicationSteps ?? const [];
  set multiplicationSteps(List<MultiplicationStepsStruct>? val) =>
      _multiplicationSteps = val;

  void updateMultiplicationSteps(
      Function(List<MultiplicationStepsStruct>) updateFn) {
    updateFn(_multiplicationSteps ??= []);
  }

  bool hasMultiplicationSteps() => _multiplicationSteps != null;

  static MultiplicationObjectStruct fromMap(Map<String, dynamic> data) =>
      MultiplicationObjectStruct(
        multiplicationSteps: getStructList(
          data['MultiplicationSteps'],
          MultiplicationStepsStruct.fromMap,
        ),
      );

  static MultiplicationObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? MultiplicationObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'MultiplicationSteps':
            _multiplicationSteps?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MultiplicationSteps': serializeParam(
          _multiplicationSteps,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MultiplicationObjectStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MultiplicationObjectStruct(
        multiplicationSteps: deserializeStructParam<MultiplicationStepsStruct>(
          data['MultiplicationSteps'],
          ParamType.DataStruct,
          true,
          structBuilder: MultiplicationStepsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MultiplicationObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MultiplicationObjectStruct &&
        listEquality.equals(multiplicationSteps, other.multiplicationSteps);
  }

  @override
  int get hashCode => const ListEquality().hash([multiplicationSteps]);
}

MultiplicationObjectStruct createMultiplicationObjectStruct() =>
    MultiplicationObjectStruct();
