// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionResponseDTOStruct extends BaseStruct {
  QuestionResponseDTOStruct({
    int? id,
    String? questionSubject,
    String? questionTopic,
    String? questionLevel,
    String? questionType,
    String? question,
    String? options,
    List<dynamic>? prompts
  })  : _id = id,
        _questionSubject = questionSubject,
        _questionTopic = questionTopic,
        _questionLevel = questionLevel,
        _questionType = questionType,
        _question = question,
        _options = options,
        _prompts = prompts;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  bool hasId() => _id != null;

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

  // "questionType" field.
  String? _questionType;
  String get questionType => _questionType ?? '';
  set questionType(String? val) => _questionType = val;

  bool hasQuestionType() => _questionType != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "options" field.
  String? _options;
  String get options => _options ?? '';
  set options(String? val) => _options = val;

  bool hasOptions() => _options != null;

    // "prompts" field.
  List<dynamic>? _prompts;
  List<dynamic> get prompts => _prompts ?? [];
  set prompts(List<dynamic>? val) => _prompts = val;

  bool hasPrompts() => _prompts != null;

  static QuestionResponseDTOStruct fromMap(Map<String, dynamic> data) =>
      QuestionResponseDTOStruct(
        id: data['id'] as int?,
        questionSubject: data['questionSubject'] as String?,
        questionTopic: data['questionTopic'] as String?,
        questionLevel: data['questionLevel'] as String?,
        questionType: data['questionType'] as String?,
        question: data['question'] as String?,
        options: data['options'] as String?,
        prompts: data['prompts'] as List<dynamic>?
      );

  static QuestionResponseDTOStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionResponseDTOStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'questionSubject': _questionSubject,
        'questionTopic': _questionTopic,
        'questionLevel': _questionLevel,
        'questionType': _questionType,
        'question': _question,
        'options': _options,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
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
        'options': serializeParam(
          _options,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionResponseDTOStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuestionResponseDTOStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
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
        options: deserializeParam(
          data['options'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionResponseDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionResponseDTOStruct &&
        id == other.id &&
        questionSubject == other.questionSubject &&
        questionTopic == other.questionTopic &&
        questionLevel == other.questionLevel &&
        questionType == other.questionType &&
        question == other.question &&
        options == other.options;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        questionSubject,
        questionTopic,
        questionLevel,
        questionType,
        question,
        options
      ]);
}

QuestionResponseDTOStruct createQuestionResponseDTOStruct({
  int? id,
  String? questionSubject,
  String? questionTopic,
  String? questionLevel,
  String? questionType,
  String? question,
  String? options,
}) =>
    QuestionResponseDTOStruct(
      id: id,
      questionSubject: questionSubject,
      questionTopic: questionTopic,
      questionLevel: questionLevel,
      questionType: questionType,
      question: question,
      options: options,
    );
