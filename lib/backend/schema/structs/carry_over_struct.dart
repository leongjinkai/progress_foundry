// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarryOverStruct extends BaseStruct {
  CarryOverStruct({
    String? tens,
    String? ones,
  })  : _tens = tens,
        _ones = ones;

  // "tens" field.
  String? _tens;
  String get tens => _tens ?? '';
  set tens(String? val) => _tens = val;

  bool hasTens() => _tens != null;

  // "ones" field.
  String? _ones;
  String get ones => _ones ?? '';
  set ones(String? val) => _ones = val;

  bool hasOnes() => _ones != null;

  static CarryOverStruct fromMap(Map<String, dynamic> data) => CarryOverStruct(
        tens: data['tens'] as String?,
        ones: data['ones'] as String?,
      );

  static CarryOverStruct? maybeFromMap(dynamic data) => data is Map
      ? CarryOverStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tens': _tens,
        'ones': _ones,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tens': serializeParam(
          _tens,
          ParamType.String,
        ),
        'ones': serializeParam(
          _ones,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarryOverStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarryOverStruct(
        tens: deserializeParam(
          data['tens'],
          ParamType.String,
          false,
        ),
        ones: deserializeParam(
          data['ones'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CarryOverStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarryOverStruct && tens == other.tens && ones == other.ones;
  }

  @override
  int get hashCode => const ListEquality().hash([tens, ones]);
}

CarryOverStruct createCarryOverStruct({
  String? tens,
  String? ones,
}) =>
    CarryOverStruct(
      tens: tens,
      ones: ones,
    );
