// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentAssignmentStruct extends BaseStruct {
  StudentAssignmentStruct({
    int? id,
    String? assignmentName,
    String? studentId,
    double? completionRate,
    double? score,
    String? createdAt,
    String? dueDate,
    String? questionSubject,
    String? questionTopic,
    String? questionLevel,
    String? questionSubLevel,
    String? questionType,
    String? feedback,
    List<AssignmentResponseDTOStruct>? assignmentQuestionResponseDTOList,
  })  : _id = id,
        _assignmentName = assignmentName,
        _studentId = studentId,
        _completionRate = completionRate,
        _score = score,
        _createdAt = createdAt,
        _dueDate = dueDate,
        _questionSubject = questionSubject,
        _questionTopic = questionTopic,
        _questionLevel = questionLevel,
        _questionSubLevel = questionSubLevel,
        _questionType = questionType,
        _feedback = feedback,
        _assignmentQuestionResponseDTOList = assignmentQuestionResponseDTOList;

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

  // "completionRate" field.
  double? _completionRate;
  double get completionRate => _completionRate ?? 0.0;
  set completionRate(double? val) => _completionRate = val;

  void incrementCompletionRate(double amount) =>
      completionRate = completionRate + amount;

  bool hasCompletionRate() => _completionRate != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  set score(double? val) => _score = val;

  bool hasScore() => _score != null;

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

  // "questionType" field.
  String? _questionType;
  String get questionType => _questionType ?? '';
  set questionType(String? val) => _questionType = val;

  bool hasQuestionType() => _questionType != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  set feedback(String? val) => _feedback = val;

  bool hasFeedback() => _feedback != null;

  // "assignmentQuestionResponseDTOList" field.
  List<AssignmentResponseDTOStruct>? _assignmentQuestionResponseDTOList;
  List<AssignmentResponseDTOStruct> get assignmentQuestionResponseDTOList =>
      _assignmentQuestionResponseDTOList ?? const [];
  set assignmentQuestionResponseDTOList(List<AssignmentResponseDTOStruct>? val) =>
      _assignmentQuestionResponseDTOList = val;

  void updateAssignmentResponseDTOList(
      Function(List<AssignmentResponseDTOStruct>) updateFn) {
    updateFn(_assignmentQuestionResponseDTOList ??= []);
  }

  bool hasAssignmentQuestionResponseDTOList() => _assignmentQuestionResponseDTOList != null;

  static StudentAssignmentStruct fromMap(Map<String, dynamic> data) =>
      StudentAssignmentStruct(
        id: data['id'] as int?,
        assignmentName: data['assignmentName'] as String?,
        studentId: data['studentId'] as String?,
        completionRate: castToType<double>(data['completionRate']),
        score: castToType<double>(data['score']),
        createdAt: data['createdAt'] as String?,
        dueDate: data['dueDate'] as String?,
        questionSubject: data['questionSubject'] as String?,
        questionTopic: data['questionTopic'] as String?,
        questionLevel: data['questionLevel'] as String?,
        questionSubLevel: data['questionSubLevel'] as String?,
        questionType: data['questionType'] as String?,
        feedback: data['feedback'] as String?,
        assignmentQuestionResponseDTOList: getStructList(
          data['assignmentQuestionResponseDTOList'],
          AssignmentResponseDTOStruct.fromMap,
        ),
      );

  static StudentAssignmentStruct? maybeFromMap(dynamic data) => data is Map
      ? StudentAssignmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'assignmentName': _assignmentName,
        'studentId': _studentId,
        'completionRate': _completionRate,
        'score': _score,
        'createdAt': _createdAt,
        'dueDate': _dueDate,
        'questionSubject': _questionSubject,
        'questionTopic': _questionTopic,
        'questionLevel': _questionLevel,
        'questionSubLevel': _questionSubLevel,
        'questionType': _questionType,
        'feedback': _feedback,
        'assignmentQuestionResponseDTOList':
            _assignmentQuestionResponseDTOList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'assignmentName': serializeParam(
          _assignmentName,
          ParamType.String,
        ),
        'studentId': serializeParam(
          _studentId,
          ParamType.String,
        ),
        'completionRate': serializeParam(
          _completionRate,
          ParamType.double,
        ),
        'score': serializeParam(
          _score,
          ParamType.double,
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
        'questionType': serializeParam(
          _questionType,
          ParamType.String,
        ),
        'feedback': serializeParam(
          _feedback,
          ParamType.String,
        ),
        'assignmentResponseDTOList': serializeParam(
          _assignmentQuestionResponseDTOList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static StudentAssignmentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudentAssignmentStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
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
        completionRate: deserializeParam(
          data['completionRate'],
          ParamType.double,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.double,
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
        questionType: deserializeParam(
          data['questionType'],
          ParamType.String,
          false,
        ),
        feedback: deserializeParam(
          data['feedback'],
          ParamType.String,
          false,
        ),
        assignmentQuestionResponseDTOList:
            deserializeStructParam<AssignmentResponseDTOStruct>(
          data['assignmentResponseDTOList'],
          ParamType.DataStruct,
          true,
          structBuilder: AssignmentResponseDTOStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudentAssignmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StudentAssignmentStruct &&
        id == other.id &&
        assignmentName == other.assignmentName &&
        studentId == other.studentId &&
        completionRate == other.completionRate &&
        score == other.score &&
        createdAt == other.createdAt &&
        dueDate == other.dueDate &&
        questionSubject == other.questionSubject &&
        questionTopic == other.questionTopic &&
        questionLevel == other.questionLevel &&
        questionSubLevel == other.questionSubLevel &&
        questionType == other.questionType &&
        feedback == other.feedback &&
        listEquality.equals(
            assignmentQuestionResponseDTOList, other.assignmentQuestionResponseDTOList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        assignmentName,
        studentId,
        completionRate,
        score,
        createdAt,
        dueDate,
        questionSubject,
        questionTopic,
        questionLevel,
        questionSubLevel,
        questionType,
        feedback,
        assignmentQuestionResponseDTOList
      ]);
}

StudentAssignmentStruct createStudentAssignmentStruct({
  int? id,
  String? assignmentName,
  String? studentId,
  double? completionRate,
  double? score,
  String? createdAt,
  String? dueDate,
  String? questionSubject,
  String? questionTopic,
  String? questionLevel,
  String? questionSubLevel,
  String? questionType,
  String? feedback,
}) =>
    StudentAssignmentStruct(
      id: id,
      assignmentName: assignmentName,
      studentId: studentId,
      completionRate: completionRate,
      score: score,
      createdAt: createdAt,
      dueDate: dueDate,
      questionSubject: questionSubject,
      questionTopic: questionTopic,
      questionLevel: questionLevel,
      questionSubLevel: questionSubLevel,
      questionType: questionType,
      feedback: feedback,
    );
