// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DivisionObjectStruct extends BaseStruct {
  DivisionObjectStruct({
    List<DivisionStepsStruct>? divisionSteps,
  }) : _divisionSteps = divisionSteps;

  // "DivisionSteps" field.
  List<DivisionStepsStruct>? _divisionSteps;
  List<DivisionStepsStruct> get divisionSteps => _divisionSteps ?? const [];
  set divisionSteps(List<DivisionStepsStruct>? val) => _divisionSteps = val;

  void updateDivisionSteps(Function(List<DivisionStepsStruct>) updateFn) {
    updateFn(_divisionSteps ??= []);
  }

  bool hasDivisionSteps() => _divisionSteps != null;

  static DivisionObjectStruct fromMap(Map<String, dynamic> data) =>
      DivisionObjectStruct(
        divisionSteps: getStructList(
          data['DivisionSteps'],
          DivisionStepsStruct.fromMap,
        ),
      );

  static DivisionObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? DivisionObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'DivisionSteps': _divisionSteps?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DivisionSteps': serializeParam(
          _divisionSteps,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DivisionObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      DivisionObjectStruct(
        divisionSteps: deserializeStructParam<DivisionStepsStruct>(
          data['DivisionSteps'],
          ParamType.DataStruct,
          true,
          structBuilder: DivisionStepsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DivisionObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DivisionObjectStruct &&
        listEquality.equals(divisionSteps, other.divisionSteps);
  }

  @override
  int get hashCode => const ListEquality().hash([divisionSteps]);
}

DivisionObjectStruct createDivisionObjectStruct() => DivisionObjectStruct();
