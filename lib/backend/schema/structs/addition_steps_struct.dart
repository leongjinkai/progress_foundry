// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionStepsStruct extends BaseStruct {
  AdditionStepsStruct({
    int? digit1,
    int? digit2,
    int? currSum,
    int? carry,
  })  : _digit1 = digit1,
        _digit2 = digit2,
        _currSum = currSum,
        _carry = carry;

  // "digit1" field.
  int? _digit1;
  int get digit1 => _digit1 ?? 0;
  set digit1(int? val) => _digit1 = val;

  void incrementDigit1(int amount) => digit1 = digit1 + amount;

  bool hasDigit1() => _digit1 != null;

  // "digit2" field.
  int? _digit2;
  int get digit2 => _digit2 ?? 0;
  set digit2(int? val) => _digit2 = val;

  void incrementDigit2(int amount) => digit2 = digit2 + amount;

  bool hasDigit2() => _digit2 != null;

  // "currSum" field.
  int? _currSum;
  int get currSum => _currSum ?? 0;
  set currSum(int? val) => _currSum = val;

  void incrementCurrSum(int amount) => currSum = currSum + amount;

  bool hasCurrSum() => _currSum != null;

  // "carry" field.
  int? _carry;
  int get carry => _carry ?? 0;
  set carry(int? val) => _carry = val;

  void incrementCarry(int amount) => carry = carry + amount;

  bool hasCarry() => _carry != null;

  static AdditionStepsStruct fromMap(Map<String, dynamic> data) =>
      AdditionStepsStruct(
        digit1: castToType<int>(data['digit1']),
        digit2: castToType<int>(data['digit2']),
        currSum: castToType<int>(data['currSum']),
        carry: castToType<int>(data['carry']),
      );

  static AdditionStepsStruct? maybeFromMap(dynamic data) => data is Map
      ? AdditionStepsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'digit1': _digit1,
        'digit2': _digit2,
        'currSum': _currSum,
        'carry': _carry,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'digit1': serializeParam(
          _digit1,
          ParamType.int,
        ),
        'digit2': serializeParam(
          _digit2,
          ParamType.int,
        ),
        'currSum': serializeParam(
          _currSum,
          ParamType.int,
        ),
        'carry': serializeParam(
          _carry,
          ParamType.int,
        ),
      }.withoutNulls;

  static AdditionStepsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdditionStepsStruct(
        digit1: deserializeParam(
          data['digit1'],
          ParamType.int,
          false,
        ),
        digit2: deserializeParam(
          data['digit2'],
          ParamType.int,
          false,
        ),
        currSum: deserializeParam(
          data['currSum'],
          ParamType.int,
          false,
        ),
        carry: deserializeParam(
          data['carry'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AdditionStepsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionStepsStruct &&
        digit1 == other.digit1 &&
        digit2 == other.digit2 &&
        currSum == other.currSum &&
        carry == other.carry;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([digit1, digit2, currSum, carry]);
}

AdditionStepsStruct createAdditionStepsStruct({
  int? digit1,
  int? digit2,
  int? currSum,
  int? carry,
}) =>
    AdditionStepsStruct(
      digit1: digit1,
      digit2: digit2,
      currSum: currSum,
      carry: carry,
    );
