// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignmentResponseDTOStruct extends BaseStruct {
  AssignmentResponseDTOStruct({
    QuestionResponseDTOStruct? questionResponseDTO,
    NormalQuestionAttemptResponseDTOStruct? normalQuestionAttemptResponseDTO,
  })  : _questionResponseDTO = questionResponseDTO,
        _normalQuestionAttemptResponseDTO = normalQuestionAttemptResponseDTO;

  // "questionResponseDTO" field.
  QuestionResponseDTOStruct? _questionResponseDTO;
  QuestionResponseDTOStruct get questionResponseDTO =>
      _questionResponseDTO ?? QuestionResponseDTOStruct();
  set questionResponseDTO(QuestionResponseDTOStruct? val) =>
      _questionResponseDTO = val;

  void updateQuestionResponseDTO(Function(QuestionResponseDTOStruct) updateFn) {
    updateFn(_questionResponseDTO ??= QuestionResponseDTOStruct());
  }

  bool hasQuestionResponseDTO() => _questionResponseDTO != null;

  // "normalQuestionAttemptResponseDTO" field.
  NormalQuestionAttemptResponseDTOStruct? _normalQuestionAttemptResponseDTO;
  NormalQuestionAttemptResponseDTOStruct get normalQuestionAttemptResponseDTO =>
      _normalQuestionAttemptResponseDTO ??
      NormalQuestionAttemptResponseDTOStruct();
  set normalQuestionAttemptResponseDTO(
          NormalQuestionAttemptResponseDTOStruct? val) =>
      _normalQuestionAttemptResponseDTO = val;

  void updateNormalQuestionAttemptResponseDTO(
      Function(NormalQuestionAttemptResponseDTOStruct) updateFn) {
    updateFn(_normalQuestionAttemptResponseDTO ??=
        NormalQuestionAttemptResponseDTOStruct());
  }

  bool hasNormalQuestionAttemptResponseDTO() =>
      _normalQuestionAttemptResponseDTO != null;

  static AssignmentResponseDTOStruct fromMap(Map<String, dynamic> data) =>
      AssignmentResponseDTOStruct(
        questionResponseDTO:
            data['questionResponseDTO'] is QuestionResponseDTOStruct
                ? data['questionResponseDTO']
                : QuestionResponseDTOStruct.maybeFromMap(
                    data['questionResponseDTO']),
        normalQuestionAttemptResponseDTO:
            data['normalQuestionAttemptResponseDTO']
                    is NormalQuestionAttemptResponseDTOStruct
                ? data['normalQuestionAttemptResponseDTO']
                : NormalQuestionAttemptResponseDTOStruct.maybeFromMap(
                    data['normalQuestionAttemptResponseDTO']),
      );

  static AssignmentResponseDTOStruct? maybeFromMap(dynamic data) => data is Map
      ? AssignmentResponseDTOStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'questionResponseDTO': _questionResponseDTO?.toMap(),
        'normalQuestionAttemptResponseDTO':
            _normalQuestionAttemptResponseDTO?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'questionResponseDTO': serializeParam(
          _questionResponseDTO,
          ParamType.DataStruct,
        ),
        'normalQuestionAttemptResponseDTO': serializeParam(
          _normalQuestionAttemptResponseDTO,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AssignmentResponseDTOStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AssignmentResponseDTOStruct(
        questionResponseDTO: deserializeStructParam(
          data['questionResponseDTO'],
          ParamType.DataStruct,
          false,
          structBuilder: QuestionResponseDTOStruct.fromSerializableMap,
        ),
        normalQuestionAttemptResponseDTO: deserializeStructParam(
          data['normalQuestionAttemptResponseDTO'],
          ParamType.DataStruct,
          false,
          structBuilder:
              NormalQuestionAttemptResponseDTOStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AssignmentResponseDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssignmentResponseDTOStruct &&
        questionResponseDTO == other.questionResponseDTO &&
        normalQuestionAttemptResponseDTO ==
            other.normalQuestionAttemptResponseDTO;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([questionResponseDTO, normalQuestionAttemptResponseDTO]);
}

AssignmentResponseDTOStruct createAssignmentResponseDTOStruct({
  QuestionResponseDTOStruct? questionResponseDTO,
  NormalQuestionAttemptResponseDTOStruct? normalQuestionAttemptResponseDTO,
}) =>
    AssignmentResponseDTOStruct(
      questionResponseDTO: questionResponseDTO ?? QuestionResponseDTOStruct(),
      normalQuestionAttemptResponseDTO: normalQuestionAttemptResponseDTO ??
          NormalQuestionAttemptResponseDTOStruct(),
    );
