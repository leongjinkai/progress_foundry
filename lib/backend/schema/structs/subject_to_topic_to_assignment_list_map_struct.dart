// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectToTopicToAssignmentListMapStruct extends BaseStruct {
  SubjectToTopicToAssignmentListMapStruct({
    MathematicsStruct? mathematics,
  }) : _mathematics = mathematics;

  // "MATHEMATICS" field.
  MathematicsStruct? _mathematics;
  MathematicsStruct get mathematics => _mathematics ?? MathematicsStruct();
  set mathematics(MathematicsStruct? val) => _mathematics = val;

  void updateMathematics(Function(MathematicsStruct) updateFn) {
    updateFn(_mathematics ??= MathematicsStruct());
  }

  bool hasMathematics() => _mathematics != null;

  static SubjectToTopicToAssignmentListMapStruct fromMap(
          Map<String, dynamic> data) =>
      SubjectToTopicToAssignmentListMapStruct(
        mathematics: data['MATHEMATICS'] is MathematicsStruct
            ? data['MATHEMATICS']
            : MathematicsStruct.maybeFromMap(data['MATHEMATICS']),
      );

  static SubjectToTopicToAssignmentListMapStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? SubjectToTopicToAssignmentListMapStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'MATHEMATICS': _mathematics?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MATHEMATICS': serializeParam(
          _mathematics,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SubjectToTopicToAssignmentListMapStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SubjectToTopicToAssignmentListMapStruct(
        mathematics: deserializeStructParam(
          data['MATHEMATICS'],
          ParamType.DataStruct,
          false,
          structBuilder: MathematicsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SubjectToTopicToAssignmentListMapStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubjectToTopicToAssignmentListMapStruct &&
        mathematics == other.mathematics;
  }

  @override
  int get hashCode => const ListEquality().hash([mathematics]);
}

SubjectToTopicToAssignmentListMapStruct
    createSubjectToTopicToAssignmentListMapStruct({
  MathematicsStruct? mathematics,
}) =>
        SubjectToTopicToAssignmentListMapStruct(
          mathematics: mathematics ?? MathematicsStruct(),
        );
