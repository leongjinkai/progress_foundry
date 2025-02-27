// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MathematicsStruct extends BaseStruct {
  MathematicsStruct({
    List<AdditionStruct>? addition,
  }) : _addition = addition;

  // "ADDITION" field.
  List<AdditionStruct>? _addition;
  List<AdditionStruct> get addition => _addition ?? const [];
  set addition(List<AdditionStruct>? val) => _addition = val;

  void updateAddition(Function(List<AdditionStruct>) updateFn) {
    updateFn(_addition ??= []);
  }

  bool hasAddition() => _addition != null;

  static MathematicsStruct fromMap(Map<String, dynamic> data) =>
      MathematicsStruct(
        addition: getStructList(
          data['ADDITION'],
          AdditionStruct.fromMap,
        ),
      );

  static MathematicsStruct? maybeFromMap(dynamic data) => data is Map
      ? MathematicsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ADDITION': _addition?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ADDITION': serializeParam(
          _addition,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MathematicsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MathematicsStruct(
        addition: deserializeStructParam<AdditionStruct>(
          data['ADDITION'],
          ParamType.DataStruct,
          true,
          structBuilder: AdditionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MathematicsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MathematicsStruct &&
        listEquality.equals(addition, other.addition);
  }

  @override
  int get hashCode => const ListEquality().hash([addition]);
}

MathematicsStruct createMathematicsStruct() => MathematicsStruct();
