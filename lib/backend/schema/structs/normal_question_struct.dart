// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NormalQuestionStruct extends BaseStruct {
  NormalQuestionStruct({
    String? id,
    String? createdAt,
    String? questionSubject,
    String? questionTopic,
    String? questionLevel,
    String? questionType,
    String? question,
    String? answer,
    String? options,
    bool? isAnswerExact,
    List<String>? additionalDetails,
  })  : _id = id,
        _createdAt = createdAt,
        _questionSubject = questionSubject,
        _questionTopic = questionTopic,
        _questionLevel = questionLevel,
        _questionType = questionType,
        _question = question,
        _answer = answer,
        _options = options,
        _isAnswerExact = isAnswerExact,
        _additionalDetails = additionalDetails;

  // "id" field.
  String? _id;
  String get id => _id ?? '4d295ea6-c4e1-43bf-a60a-20eb74116c0b';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '2024-08-16T13:20:41.606237600Z';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "questionSubject" field.
  String? _questionSubject;
  String get questionSubject => _questionSubject ?? 'MATHEMATICS';
  set questionSubject(String? val) => _questionSubject = val;

  bool hasQuestionSubject() => _questionSubject != null;

  // "questionTopic" field.
  String? _questionTopic;
  String get questionTopic => _questionTopic ?? 'ADDITION';
  set questionTopic(String? val) => _questionTopic = val;

  bool hasQuestionTopic() => _questionTopic != null;

  // "questionLevel" field.
  String? _questionLevel;
  String get questionLevel => _questionLevel ?? 'SINGLE_DIGIT';
  set questionLevel(String? val) => _questionLevel = val;

  bool hasQuestionLevel() => _questionLevel != null;

  // "questionType" field.
  String? _questionType;
  String get questionType => _questionType ?? 'SHORT_ANSWER';
  set questionType(String? val) => _questionType = val;

  bool hasQuestionType() => _questionType != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '? + ? = ?';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '5';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  // "options" field.
  String? _options;
  String get options => _options ?? 'null';
  set options(String? val) => _options = val;

  bool hasOptions() => _options != null;

  // "isAnswerExact" field.
  bool? _isAnswerExact;
  bool get isAnswerExact => _isAnswerExact ?? true;
  set isAnswerExact(bool? val) => _isAnswerExact = val;

  bool hasIsAnswerExact() => _isAnswerExact != null;

  // "additionalDetails" field.
  List<String>? _additionalDetails;
  List<String> get additionalDetails => _additionalDetails ?? const [];
  set additionalDetails(List<String>? val) => _additionalDetails = val;

  void updateAdditionalDetails(Function(List<String>) updateFn) {
    updateFn(_additionalDetails ??= []);
  }

  bool hasAdditionalDetails() => _additionalDetails != null;

  static NormalQuestionStruct fromMap(Map<String, dynamic> data) =>
      NormalQuestionStruct(
        id: data['id'] as String?,
        createdAt: data['createdAt'] as String?,
        questionSubject: data['questionSubject'] as String?,
        questionTopic: data['questionTopic'] as String?,
        questionLevel: data['questionLevel'] as String?,
        questionType: data['questionType'] as String?,
        question: data['question'] as String?,
        answer: data['answer'] as String?,
        options: data['options'] as String?,
        isAnswerExact: data['isAnswerExact'] as bool?,
        additionalDetails: getDataList(data['additionalDetails']),
      );

  static NormalQuestionStruct? maybeFromMap(dynamic data) => data is Map
      ? NormalQuestionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'createdAt': _createdAt,
        'questionSubject': _questionSubject,
        'questionTopic': _questionTopic,
        'questionLevel': _questionLevel,
        'questionType': _questionType,
        'question': _question,
        'answer': _answer,
        'options': _options,
        'isAnswerExact': _isAnswerExact,
        'additionalDetails': _additionalDetails,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
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
        'questionType': serializeParam(
          _questionType,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
        ),
        'isAnswerExact': serializeParam(
          _isAnswerExact,
          ParamType.bool,
        ),
        'additionalDetails': serializeParam(
          _additionalDetails,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static NormalQuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      NormalQuestionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
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
        questionType: deserializeParam(
          data['questionType'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        options: deserializeParam(
          data['options'],
          ParamType.String,
          false,
        ),
        isAnswerExact: deserializeParam(
          data['isAnswerExact'],
          ParamType.bool,
          false,
        ),
        additionalDetails: deserializeParam<String>(
          data['additionalDetails'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'NormalQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NormalQuestionStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        questionSubject == other.questionSubject &&
        questionTopic == other.questionTopic &&
        questionLevel == other.questionLevel &&
        questionType == other.questionType &&
        question == other.question &&
        answer == other.answer &&
        options == other.options &&
        isAnswerExact == other.isAnswerExact &&
        listEquality.equals(additionalDetails, other.additionalDetails);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        questionSubject,
        questionTopic,
        questionLevel,
        questionType,
        question,
        answer,
        options,
        isAnswerExact,
        additionalDetails
      ]);
}

NormalQuestionStruct createNormalQuestionStruct({
  String? id,
  String? createdAt,
  String? questionSubject,
  String? questionTopic,
  String? questionLevel,
  String? questionType,
  String? question,
  String? answer,
  String? options,
  bool? isAnswerExact,
}) =>
    NormalQuestionStruct(
      id: id,
      createdAt: createdAt,
      questionSubject: questionSubject,
      questionTopic: questionTopic,
      questionLevel: questionLevel,
      questionType: questionType,
      question: question,
      answer: answer,
      options: options,
      isAnswerExact: isAnswerExact,
    );
