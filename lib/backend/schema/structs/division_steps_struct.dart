// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DivisionStepsStruct extends BaseStruct {
  DivisionStepsStruct({
    int? currValue,
    int? quotientDigit,
    int? currRemainder,
    int? result,
  })  : _currValue = currValue,
        _quotientDigit = quotientDigit,
        _currRemainder = currRemainder,
        _result = result;

  // "currValue" field.
  int? _currValue;
  int get currValue => _currValue ?? 0;
  set currValue(int? val) => _currValue = val;

  void incrementCurrValue(int amount) => currValue = currValue + amount;

  bool hasCurrValue() => _currValue != null;

  // "quotientDigit" field.
  int? _quotientDigit;
  int get quotientDigit => _quotientDigit ?? 0;
  set quotientDigit(int? val) => _quotientDigit = val;

  void incrementQuotientDigit(int amount) =>
      quotientDigit = quotientDigit + amount;

  bool hasQuotientDigit() => _quotientDigit != null;

  // "currRemainder" field.
  int? _currRemainder;
  int get currRemainder => _currRemainder ?? 0;
  set currRemainder(int? val) => _currRemainder = val;

  void incrementCurrRemainder(int amount) =>
      currRemainder = currRemainder + amount;

  bool hasCurrRemainder() => _currRemainder != null;

  // "result" field.
  int? _result;
  int get result => _result ?? 0;
  set result(int? val) => _result = val;

  void incrementResult(int amount) => result = result + amount;

  bool hasResult() => _result != null;

  static DivisionStepsStruct fromMap(Map<String, dynamic> data) =>
      DivisionStepsStruct(
        currValue: castToType<int>(data['currValue']),
        quotientDigit: castToType<int>(data['quotientDigit']),
        currRemainder: castToType<int>(data['currRemainder']),
        result: castToType<int>(data['result']),
      );

  static DivisionStepsStruct? maybeFromMap(dynamic data) => data is Map
      ? DivisionStepsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'currValue': _currValue,
        'quotientDigit': _quotientDigit,
        'currRemainder': _currRemainder,
        'result': _result,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'currValue': serializeParam(
          _currValue,
          ParamType.int,
        ),
        'quotientDigit': serializeParam(
          _quotientDigit,
          ParamType.int,
        ),
        'currRemainder': serializeParam(
          _currRemainder,
          ParamType.int,
        ),
        'result': serializeParam(
          _result,
          ParamType.int,
        ),
      }.withoutNulls;

  static DivisionStepsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DivisionStepsStruct(
        currValue: deserializeParam(
          data['currValue'],
          ParamType.int,
          false,
        ),
        quotientDigit: deserializeParam(
          data['quotientDigit'],
          ParamType.int,
          false,
        ),
        currRemainder: deserializeParam(
          data['currRemainder'],
          ParamType.int,
          false,
        ),
        result: deserializeParam(
          data['result'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DivisionStepsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DivisionStepsStruct &&
        currValue == other.currValue &&
        quotientDigit == other.quotientDigit &&
        currRemainder == other.currRemainder &&
        result == other.result;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([currValue, quotientDigit, currRemainder, result]);
}

DivisionStepsStruct createDivisionStepsStruct({
  int? currValue,
  int? quotientDigit,
  int? currRemainder,
  int? result,
}) =>
    DivisionStepsStruct(
      currValue: currValue,
      quotientDigit: quotientDigit,
      currRemainder: currRemainder,
      result: result,
    );
