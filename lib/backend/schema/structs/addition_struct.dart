// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionStruct extends BaseStruct {
  AdditionStruct({
    int? id,
    String? assignmentName,
    String? studentId,
    String? createdAt,
    String? dueDate,
    String? questionSubject,
    String? questionTopic,
    String? questionLevel,
    String? questionSubLevel,
  })  : _id = id,
        _assignmentName = assignmentName,
        _studentId = studentId,
        _createdAt = createdAt,
        _dueDate = dueDate,
        _questionSubject = questionSubject,
        _questionTopic = questionTopic,
        _questionLevel = questionLevel,
        _questionSubLevel = questionSubLevel;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  bool hasId() => _id != null;

  // "assignmentName" field.
  String? _assignmentName;
  String get assignmentName => _assignmentName ?? '';
  set assignmentName(String? val) => _assignmentName = val;

  bool hasAssignmentName() => _assignmentName != null;

  // "studentId" field.
  String? _studentId;
  String get studentId => _studentId ?? '';
  set studentId(String? val) => _studentId = val;

  bool hasStudentId() => _studentId != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "dueDate" field.
  String? _dueDate;
  String get dueDate => _dueDate ?? '';
  set dueDate(String? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "questionSubject" field.
  String? _questionSubject;
  String get questionSubject => _questionSubject ?? '';
  set questionSubject(String? val) => _questionSubject = val;

  bool hasQuestionSubject() => _questionSubject != null;

  // "questionTopic" field.
  String? _questionTopic;
  String get questionTopic => _questionTopic ?? '';
  set questionTopic(String? val) => _questionTopic = val;

  bool hasQuestionTopic() => _questionTopic != null;

  // "questionLevel" field.
  String? _questionLevel;
  String get questionLevel => _questionLevel ?? '';
  set questionLevel(String? val) => _questionLevel = val;

  bool hasQuestionLevel() => _questionLevel != null;

  // "questionSubLevel" field.
  String? _questionSubLevel;
  String get questionSubLevel => _questionSubLevel ?? '';
  set questionSubLevel(String? val) => _questionSubLevel = val;

  bool hasQuestionSubLevel() => _questionSubLevel != null;

  static AdditionStruct fromMap(Map<String, dynamic> data) => AdditionStruct(
        id: data['id'] as int?,
        assignmentName: data['assignmentName'] as String?,
        studentId: data['studentId'] as String?,
        createdAt: data['createdAt'] as String?,
        dueDate: data['dueDate'] as String?,
        questionSubject: data['questionSubject'] as String?,
        questionTopic: data['questionTopic'] as String?,
        questionLevel: data['questionLevel'] as String?,
        questionSubLevel: data['questionSubLevel'] as String?,
      );

  static AdditionStruct? maybeFromMap(dynamic data) =>
      data is Map ? AdditionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'assignmentName': _assignmentName,
        'studentId': _studentId,
        'createdAt': _createdAt,
        'dueDate': _dueDate,
        'questionSubject': _questionSubject,
        'questionTopic': _questionTopic,
        'questionLevel': _questionLevel,
        'questionSubLevel': _questionSubLevel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'assignmentName': serializeParam(
          _assignmentName,
          ParamType.String,
        ),
        'studentId': serializeParam(
          _studentId,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'dueDate': serializeParam(
          _dueDate,
          ParamType.String,
        ),
        'questionSubject': serializeParam(
          _questionSubject,
          ParamType.String,
        ),
        'questionTopic': serializeParam(
          _questionTopic,
          ParamType.String,
        ),
        'questionLevel': serializeParam(
          _questionLevel,
          ParamType.String,
        ),
        'questionSubLevel': serializeParam(
          _questionSubLevel,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdditionStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdditionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        assignmentName: deserializeParam(
          data['assignmentName'],
          ParamType.String,
          false,
        ),
        studentId: deserializeParam(
          data['studentId'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        dueDate: deserializeParam(
          data['dueDate'],
          ParamType.String,
          false,
        ),
        questionSubject: deserializeParam(
          data['questionSubject'],
          ParamType.String,
          false,
        ),
        questionTopic: deserializeParam(
          data['questionTopic'],
          ParamType.String,
          false,
        ),
        questionLevel: deserializeParam(
          data['questionLevel'],
          ParamType.String,
          false,
        ),
        questionSubLevel: deserializeParam(
          data['questionSubLevel'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdditionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionStruct &&
        id == other.id &&
        assignmentName == other.assignmentName &&
        studentId == other.studentId &&
        createdAt == other.createdAt &&
        dueDate == other.dueDate &&
        questionSubject == other.questionSubject &&
        questionTopic == other.questionTopic &&
        questionLevel == other.questionLevel &&
        questionSubLevel == other.questionSubLevel;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        assignmentName,
        studentId,
        createdAt,
        dueDate,
        questionSubject,
        questionTopic,
        questionLevel,
        questionSubLevel
      ]);
}

AdditionStruct createAdditionStruct({
  int? id,
  String? assignmentName,
  String? studentId,
  String? createdAt,
  String? dueDate,
  String? questionSubject,
  String? questionTopic,
  String? questionLevel,
  String? questionSubLevel,
}) =>
    AdditionStruct(
      id: id,
      assignmentName: assignmentName,
      studentId: studentId,
      createdAt: createdAt,
      dueDate: dueDate,
      questionSubject: questionSubject,
      questionTopic: questionTopic,
      questionLevel: questionLevel,
      questionSubLevel: questionSubLevel,
    );
