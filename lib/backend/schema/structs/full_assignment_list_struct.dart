// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FullAssignmentListStruct extends BaseStruct {
  FullAssignmentListStruct({
    List<AssignmentStruct>? addition,
    List<AssignmentStruct>? subtraction,
    List<AssignmentStruct>? multiplication,
    List<AssignmentStruct>? division,
  })  : _addition = addition,
        _subtraction = subtraction,
        _multiplication = multiplication,
        _division = division;

  // "Addition" field.
  List<AssignmentStruct>? _addition;
  List<AssignmentStruct> get addition => _addition ?? const [];
  set addition(List<AssignmentStruct>? val) => _addition = val;

  void updateAddition(Function(List<AssignmentStruct>) updateFn) {
    updateFn(_addition ??= []);
  }

  bool hasAddition() => _addition != null;

  // "Subtraction" field.
  List<AssignmentStruct>? _subtraction;
  List<AssignmentStruct> get subtraction => _subtraction ?? const [];
  set subtraction(List<AssignmentStruct>? val) => _subtraction = val;

  void updateSubtraction(Function(List<AssignmentStruct>) updateFn) {
    updateFn(_subtraction ??= []);
  }

  bool hasSubtraction() => _subtraction != null;

  // "Multiplication" field.
  List<AssignmentStruct>? _multiplication;
  List<AssignmentStruct> get multiplication => _multiplication ?? const [];
  set multiplication(List<AssignmentStruct>? val) => _multiplication = val;

  void updateMultiplication(Function(List<AssignmentStruct>) updateFn) {
    updateFn(_multiplication ??= []);
  }

  bool hasMultiplication() => _multiplication != null;

  // "Division" field.
  List<AssignmentStruct>? _division;
  List<AssignmentStruct> get division => _division ?? const [];
  set division(List<AssignmentStruct>? val) => _division = val;

  void updateDivision(Function(List<AssignmentStruct>) updateFn) {
    updateFn(_division ??= []);
  }

  bool hasDivision() => _division != null;

  static FullAssignmentListStruct fromMap(Map<String, dynamic> data) =>
      FullAssignmentListStruct(
        addition: getStructList(
          data['Addition'],
          AssignmentStruct.fromMap,
        ),
        subtraction: getStructList(
          data['Subtraction'],
          AssignmentStruct.fromMap,
        ),
        multiplication: getStructList(
          data['Multiplication'],
          AssignmentStruct.fromMap,
        ),
        division: getStructList(
          data['Division'],
          AssignmentStruct.fromMap,
        ),
      );

  static FullAssignmentListStruct? maybeFromMap(dynamic data) => data is Map
      ? FullAssignmentListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Addition': _addition?.map((e) => e.toMap()).toList(),
        'Subtraction': _subtraction?.map((e) => e.toMap()).toList(),
        'Multiplication': _multiplication?.map((e) => e.toMap()).toList(),
        'Division': _division?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Addition': serializeParam(
          _addition,
          ParamType.DataStruct,
          isList: true,
        ),
        'Subtraction': serializeParam(
          _subtraction,
          ParamType.DataStruct,
          isList: true,
        ),
        'Multiplication': serializeParam(
          _multiplication,
          ParamType.DataStruct,
          isList: true,
        ),
        'Division': serializeParam(
          _division,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static FullAssignmentListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FullAssignmentListStruct(
        addition: deserializeStructParam<AssignmentStruct>(
          data['Addition'],
          ParamType.DataStruct,
          true,
          structBuilder: AssignmentStruct.fromSerializableMap,
        ),
        subtraction: deserializeStructParam<AssignmentStruct>(
          data['Subtraction'],
          ParamType.DataStruct,
          true,
          structBuilder: AssignmentStruct.fromSerializableMap,
        ),
        multiplication: deserializeStructParam<AssignmentStruct>(
          data['Multiplication'],
          ParamType.DataStruct,
          true,
          structBuilder: AssignmentStruct.fromSerializableMap,
        ),
        division: deserializeStructParam<AssignmentStruct>(
          data['Division'],
          ParamType.DataStruct,
          true,
          structBuilder: AssignmentStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FullAssignmentListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FullAssignmentListStruct &&
        listEquality.equals(addition, other.addition) &&
        listEquality.equals(subtraction, other.subtraction) &&
        listEquality.equals(multiplication, other.multiplication) &&
        listEquality.equals(division, other.division);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([addition, subtraction, multiplication, division]);
}

FullAssignmentListStruct createFullAssignmentListStruct() =>
    FullAssignmentListStruct();
