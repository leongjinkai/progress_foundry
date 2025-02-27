// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubtractionStepsStruct extends BaseStruct {
  SubtractionStepsStruct({
    int? bigNum,
    int? smallNum,
    int? borrowed,
    int? result,
  })  : _bigNum = bigNum,
        _smallNum = smallNum,
        _borrowed = borrowed,
        _result = result;

  // "bigNum" field.
  int? _bigNum;
  int get bigNum => _bigNum ?? 0;
  set bigNum(int? val) => _bigNum = val;

  void incrementBigNum(int amount) => bigNum = bigNum + amount;

  bool hasBigNum() => _bigNum != null;

  // "smallNum" field.
  int? _smallNum;
  int get smallNum => _smallNum ?? 0;
  set smallNum(int? val) => _smallNum = val;

  void incrementSmallNum(int amount) => smallNum = smallNum + amount;

  bool hasSmallNum() => _smallNum != null;

  // "borrowed" field.
  int? _borrowed;
  int get borrowed => _borrowed ?? 0;
  set borrowed(int? val) => _borrowed = val;

  void incrementBorrowed(int amount) => borrowed = borrowed + amount;

  bool hasBorrowed() => _borrowed != null;

  // "result" field.
  int? _result;
  int get result => _result ?? 0;
  set result(int? val) => _result = val;

  void incrementResult(int amount) => result = result + amount;

  bool hasResult() => _result != null;

  static SubtractionStepsStruct fromMap(Map<String, dynamic> data) =>
      SubtractionStepsStruct(
        bigNum: castToType<int>(data['bigNum']),
        smallNum: castToType<int>(data['smallNum']),
        borrowed: castToType<int>(data['borrowed']),
        result: castToType<int>(data['result']),
      );

  static SubtractionStepsStruct? maybeFromMap(dynamic data) => data is Map
      ? SubtractionStepsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bigNum': _bigNum,
        'smallNum': _smallNum,
        'borrowed': _borrowed,
        'result': _result,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bigNum': serializeParam(
          _bigNum,
          ParamType.int,
        ),
        'smallNum': serializeParam(
          _smallNum,
          ParamType.int,
        ),
        'borrowed': serializeParam(
          _borrowed,
          ParamType.int,
        ),
        'result': serializeParam(
          _result,
          ParamType.int,
        ),
      }.withoutNulls;

  static SubtractionStepsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SubtractionStepsStruct(
        bigNum: deserializeParam(
          data['bigNum'],
          ParamType.int,
          false,
        ),
        smallNum: deserializeParam(
          data['smallNum'],
          ParamType.int,
          false,
        ),
        borrowed: deserializeParam(
          data['borrowed'],
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
  String toString() => 'SubtractionStepsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubtractionStepsStruct &&
        bigNum == other.bigNum &&
        smallNum == other.smallNum &&
        borrowed == other.borrowed &&
        result == other.result;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([bigNum, smallNum, borrowed, result]);
}

SubtractionStepsStruct createSubtractionStepsStruct({
  int? bigNum,
  int? smallNum,
  int? borrowed,
  int? result,
}) =>
    SubtractionStepsStruct(
      bigNum: bigNum,
      smallNum: smallNum,
      borrowed: borrowed,
      result: result,
    );
