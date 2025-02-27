// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentProgressResponseStruct extends BaseStruct {
  StudentProgressResponseStruct({
    String? studentId,
    int? overallScore,
    String? timeOnApp,
    SubjectToTopicToAssignmentListMapStruct? subjectToTopicToAssignmentListMap,
    List<StudentAssignmentStruct>? activeAssignmentList,
  })  : _studentId = studentId,
        _overallScore = overallScore,
        _timeOnApp = timeOnApp,
        _subjectToTopicToAssignmentListMap = subjectToTopicToAssignmentListMap,
        _activeAssignmentList = activeAssignmentList;

  // "studentId" field.
  String? _studentId;
  String get studentId => _studentId ?? '';
  set studentId(String? val) => _studentId = val;

  bool hasStudentId() => _studentId != null;

  // "overallScore" field.
  int? _overallScore;
  int get overallScore => _overallScore ?? 0;
  set overallScore(int? val) => _overallScore = val;

  void incrementOverallScore(int amount) =>
      overallScore = overallScore + amount;

  bool hasOverallScore() => _overallScore != null;

  // "timeOnApp" field.
  String? _timeOnApp;
  String get timeOnApp => _timeOnApp ?? '';
  set timeOnApp(String? val) => _timeOnApp = val;

  bool hasTimeOnApp() => _timeOnApp != null;

  // "subjectToTopicToAssignmentListMap" field.
  SubjectToTopicToAssignmentListMapStruct? _subjectToTopicToAssignmentListMap;
  SubjectToTopicToAssignmentListMapStruct
      get subjectToTopicToAssignmentListMap =>
          _subjectToTopicToAssignmentListMap ??
          SubjectToTopicToAssignmentListMapStruct();
  set subjectToTopicToAssignmentListMap(
          SubjectToTopicToAssignmentListMapStruct? val) =>
      _subjectToTopicToAssignmentListMap = val;

  void updateSubjectToTopicToAssignmentListMap(
      Function(SubjectToTopicToAssignmentListMapStruct) updateFn) {
    updateFn(_subjectToTopicToAssignmentListMap ??=
        SubjectToTopicToAssignmentListMapStruct());
  }

  bool hasSubjectToTopicToAssignmentListMap() =>
      _subjectToTopicToAssignmentListMap != null;

  // "activeAssignmentList" field.
  List<StudentAssignmentStruct>? _activeAssignmentList;
  List<StudentAssignmentStruct> get activeAssignmentList =>
      _activeAssignmentList ?? const [];
  set activeAssignmentList(List<StudentAssignmentStruct>? val) =>
      _activeAssignmentList = val;

  void updateActiveAssignmentList(
      Function(List<StudentAssignmentStruct>) updateFn) {
    updateFn(_activeAssignmentList ??= []);
  }

  bool hasActiveAssignmentList() => _activeAssignmentList != null;

  static StudentProgressResponseStruct fromMap(Map<String, dynamic> data) =>
      StudentProgressResponseStruct(
        studentId: data['studentId'] as String?,
        overallScore: castToType<int>(data['overallScore']),
        timeOnApp: data['timeOnApp'] as String?,
        subjectToTopicToAssignmentListMap:
            data['subjectToTopicToAssignmentListMap']
                    is SubjectToTopicToAssignmentListMapStruct
                ? data['subjectToTopicToAssignmentListMap']
                : SubjectToTopicToAssignmentListMapStruct.maybeFromMap(
                    data['subjectToTopicToAssignmentListMap']),
        activeAssignmentList: getStructList(
          data['activeAssignmentList'],
          StudentAssignmentStruct.fromMap,
        ),
      );

  static StudentProgressResponseStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? StudentProgressResponseStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'studentId': _studentId,
        'overallScore': _overallScore,
        'timeOnApp': _timeOnApp,
        'subjectToTopicToAssignmentListMap':
            _subjectToTopicToAssignmentListMap?.toMap(),
        'activeAssignmentList':
            _activeAssignmentList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'studentId': serializeParam(
          _studentId,
          ParamType.String,
        ),
        'overallScore': serializeParam(
          _overallScore,
          ParamType.int,
        ),
        'timeOnApp': serializeParam(
          _timeOnApp,
          ParamType.String,
        ),
        'subjectToTopicToAssignmentListMap': serializeParam(
          _subjectToTopicToAssignmentListMap,
          ParamType.DataStruct,
        ),
        'activeAssignmentList': serializeParam(
          _activeAssignmentList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static StudentProgressResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudentProgressResponseStruct(
        studentId: deserializeParam(
          data['studentId'],
          ParamType.String,
          false,
        ),
        overallScore: deserializeParam(
          data['overallScore'],
          ParamType.int,
          false,
        ),
        timeOnApp: deserializeParam(
          data['timeOnApp'],
          ParamType.String,
          false,
        ),
        subjectToTopicToAssignmentListMap: deserializeStructParam(
          data['subjectToTopicToAssignmentListMap'],
          ParamType.DataStruct,
          false,
          structBuilder:
              SubjectToTopicToAssignmentListMapStruct.fromSerializableMap,
        ),
        activeAssignmentList: deserializeStructParam<StudentAssignmentStruct>(
          data['activeAssignmentList'],
          ParamType.DataStruct,
          true,
          structBuilder: StudentAssignmentStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudentProgressResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StudentProgressResponseStruct &&
        studentId == other.studentId &&
        overallScore == other.overallScore &&
        timeOnApp == other.timeOnApp &&
        subjectToTopicToAssignmentListMap ==
            other.subjectToTopicToAssignmentListMap &&
        listEquality.equals(activeAssignmentList, other.activeAssignmentList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        studentId,
        overallScore,
        timeOnApp,
        subjectToTopicToAssignmentListMap,
        activeAssignmentList
      ]);
}

StudentProgressResponseStruct createStudentProgressResponseStruct({
  String? studentId,
  int? overallScore,
  String? timeOnApp,
  SubjectToTopicToAssignmentListMapStruct? subjectToTopicToAssignmentListMap,
}) =>
    StudentProgressResponseStruct(
      studentId: studentId,
      overallScore: overallScore,
      timeOnApp: timeOnApp,
      subjectToTopicToAssignmentListMap: subjectToTopicToAssignmentListMap ??
          SubjectToTopicToAssignmentListMapStruct(),
    );
