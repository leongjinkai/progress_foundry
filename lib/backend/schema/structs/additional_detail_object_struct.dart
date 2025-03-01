// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalDetailObjectStruct extends BaseStruct {
  AdditionalDetailObjectStruct({
    String? mathOperation,
    List<MathStepStruct>? mathSteps,
  }) : 
    _mathSteps = mathSteps,
    _mathOperation = mathOperation;

  // "mathSteps" field.
  List<MathStepStruct>? _mathSteps;
  List<MathStepStruct> get mathSteps =>
      _mathSteps ?? [];
  set mathSteps(List<MathStepStruct>? val) => _mathSteps = val;

  void updateMathSteps(Function(List<MathStepStruct>) updateFn) {
    updateFn(_mathSteps ??= []);
  }

  bool hasMathSteps() => _mathSteps != null;

  // "mathOperation" field.
  String? _mathOperation;
  String get mathOperation =>
      _mathOperation ?? "";
  set mathOperation(String? val) => _mathOperation = val;

  void updateMathOperation(Function(String) updateFn) {
    updateFn(_mathOperation ??= "");
  }

  bool hasMathOperation() => _mathOperation != null;

  static AdditionalDetailObjectStruct fromMap(Map<String, dynamic> data) =>
      AdditionalDetailObjectStruct(
        mathSteps: data['mathSteps'] is List<MathStepStruct>
            ? data['mathSteps']
            : MathStepStruct.fromMap(data['mathSteps']),
      );

  static AdditionalDetailObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? AdditionalDetailObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mathOperation': _mathOperation,
        'mathSteps': _mathSteps?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mathOperation': serializeParam(
          _mathOperation,
          ParamType.int,
        ),
        'mathSteps': serializeParam(
          _mathSteps,
          isList: true,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AdditionalDetailObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdditionalDetailObjectStruct(
        mathSteps: deserializeStructParam(
          data['mathSteps'],
          ParamType.DataStruct,
          false,
          structBuilder: MathStepStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AdditionalDetailObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionalDetailObjectStruct &&
        mathSteps == other.mathSteps;
  }

  @override
  int get hashCode => const ListEquality().hash([mathSteps]);
}

AdditionalDetailObjectStruct createAdditionalDetailObjectStruct({
  List<MathStepStruct>? mathSteps,
  String? mathOperation
}) =>
    AdditionalDetailObjectStruct(
      mathSteps: mathSteps ?? [],
      mathOperation: mathOperation ?? ""
    );
