// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentStruct extends BaseStruct {
  StudentStruct({
    String? studentId,
  }) : _studentId = studentId;

  // "studentId" field.
  String? _studentId;
  String get studentId => _studentId ?? '690794cd-40fc-41a6-ad6b-63ee6489c99a';
  set studentId(String? val) => _studentId = val;

  bool hasStudentId() => _studentId != null;

  static StudentStruct fromMap(Map<String, dynamic> data) => StudentStruct(
        studentId: data['studentId'] as String?,
      );

  static StudentStruct? maybeFromMap(dynamic data) =>
      data is Map ? StudentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'studentId': _studentId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'studentId': serializeParam(
          _studentId,
          ParamType.String,
        ),
      }.withoutNulls;

  static StudentStruct fromSerializableMap(Map<String, dynamic> data) =>
      StudentStruct(
        studentId: deserializeParam(
          data['studentId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StudentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StudentStruct && studentId == other.studentId;
  }

  @override
  int get hashCode => const ListEquality().hash([studentId]);
}

StudentStruct createStudentStruct({
  String? studentId,
}) =>
    StudentStruct(
      studentId: studentId,
    );
