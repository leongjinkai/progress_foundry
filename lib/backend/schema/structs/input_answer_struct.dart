// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InputAnswerStruct extends BaseStruct {
  InputAnswerStruct({
    List<String>? ansList,
  }) : _ansList = ansList;

  // "ansList" field.
  List<String>? _ansList;
  List<String> get ansList => _ansList ?? const [];
  set ansList(List<String>? val) => _ansList = val;

  void updateAnsList(Function(List<String>) updateFn) {
    updateFn(_ansList ??= []);
  }

  bool hasAnsList() => _ansList != null;

  static InputAnswerStruct fromMap(Map<String, dynamic> data) =>
      InputAnswerStruct(
        ansList: getDataList(data['ansList']),
      );

  static InputAnswerStruct? maybeFromMap(dynamic data) => data is Map
      ? InputAnswerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ansList': _ansList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ansList': serializeParam(
          _ansList,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static InputAnswerStruct fromSerializableMap(Map<String, dynamic> data) =>
      InputAnswerStruct(
        ansList: deserializeParam<String>(
          data['ansList'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'InputAnswerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InputAnswerStruct &&
        listEquality.equals(ansList, other.ansList);
  }

  @override
  int get hashCode => const ListEquality().hash([ansList]);
}

InputAnswerStruct createInputAnswerStruct() => InputAnswerStruct();
