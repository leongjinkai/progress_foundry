// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NormalQuestionAttemptResponseDTOStruct extends BaseStruct {
  NormalQuestionAttemptResponseDTOStruct({
    int? id,
    String? studentId,
    int? normalQuestionId,
    String? submittedAnswer,
    bool? isCorrect,
    String? createdAt,
  })  : _id = id,
        _studentId = studentId,
        _normalQuestionId = normalQuestionId,
        _submittedAnswer = submittedAnswer,
        _isCorrect = isCorrect,
        _createdAt = createdAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  bool hasId() => _id != null;

  // "studentId" field.
  String? _studentId;
  String get studentId => _studentId ?? '';
  set studentId(String? val) => _studentId = val;

  bool hasStudentId() => _studentId != null;

  // "normalQuestionId" field.
  int? _normalQuestionId;
  int get normalQuestionId => _normalQuestionId ?? 0;
  set normalQuestionId(int? val) => _normalQuestionId = val;

  bool hasNormalQuestionId() => _normalQuestionId != null;

  // "submittedAnswer" field.
  String? _submittedAnswer;
  String get submittedAnswer => _submittedAnswer ?? '';
  set submittedAnswer(String? val) => _submittedAnswer = val;

  bool hasSubmittedAnswer() => _submittedAnswer != null;

  // "isCorrect" field.
  bool? _isCorrect;
  bool get isCorrect => _isCorrect ?? false;
  set isCorrect(bool? val) => _isCorrect = val;

  bool hasIsCorrect() => _isCorrect != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static NormalQuestionAttemptResponseDTOStruct fromMap(
          Map<String, dynamic> data) =>
      NormalQuestionAttemptResponseDTOStruct(
        id: data['id'] as int?,
        studentId: data['studentId'] as String?,
        normalQuestionId: data['normalQuestionId'] as int?,
        submittedAnswer: data['submittedAnswer'] as String?,
        isCorrect: data['isCorrect'] as bool?,
        createdAt: data['createdAt'] as String?,
      );

  static NormalQuestionAttemptResponseDTOStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? NormalQuestionAttemptResponseDTOStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'studentId': _studentId,
        'normalQuestionId': _normalQuestionId,
        'submittedAnswer': _submittedAnswer,
        'isCorrect': _isCorrect,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'studentId': serializeParam(
          _studentId,
          ParamType.String,
        ),
        'normalQuestionId': serializeParam(
          _normalQuestionId,
          ParamType.int,
        ),
        'submittedAnswer': serializeParam(
          _submittedAnswer,
          ParamType.String,
        ),
        'isCorrect': serializeParam(
          _isCorrect,
          ParamType.bool,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static NormalQuestionAttemptResponseDTOStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NormalQuestionAttemptResponseDTOStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        studentId: deserializeParam(
          data['studentId'],
          ParamType.String,
          false,
        ),
        normalQuestionId: deserializeParam(
          data['normalQuestionId'],
          ParamType.int,
          false,
        ),
        submittedAnswer: deserializeParam(
          data['submittedAnswer'],
          ParamType.String,
          false,
        ),
        isCorrect: deserializeParam(
          data['isCorrect'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NormalQuestionAttemptResponseDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NormalQuestionAttemptResponseDTOStruct &&
        id == other.id &&
        studentId == other.studentId &&
        normalQuestionId == other.normalQuestionId &&
        submittedAnswer == other.submittedAnswer &&
        isCorrect == other.isCorrect &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, studentId, normalQuestionId, submittedAnswer, isCorrect, createdAt]);
}

NormalQuestionAttemptResponseDTOStruct
    createNormalQuestionAttemptResponseDTOStruct({
  int? id,
  String? studentId,
  int? normalQuestionId,
  String? submittedAnswer,
  bool? isCorrect,
  String? createdAt,
}) =>
        NormalQuestionAttemptResponseDTOStruct(
          id: id,
          studentId: studentId,
          normalQuestionId: normalQuestionId,
          submittedAnswer: submittedAnswer,
          isCorrect: isCorrect,
          createdAt: createdAt,
        );
