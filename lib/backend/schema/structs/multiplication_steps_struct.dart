// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultiplicationStepsStruct extends BaseStruct {
  MultiplicationStepsStruct({
    int? partialResult,
    int? productDigit,
    int? carry,
    int? product,
  })  : _partialResult = partialResult,
        _productDigit = productDigit,
        _carry = carry,
        _product = product;

  // "partialResult" field.
  int? _partialResult;
  int get partialResult => _partialResult ?? 0;
  set partialResult(int? val) => _partialResult = val;

  void incrementPartialResult(int amount) =>
      partialResult = partialResult + amount;

  bool hasPartialResult() => _partialResult != null;

  // "productDigit" field.
  int? _productDigit;
  int get productDigit => _productDigit ?? 0;
  set productDigit(int? val) => _productDigit = val;

  void incrementProductDigit(int amount) =>
      productDigit = productDigit + amount;

  bool hasProductDigit() => _productDigit != null;

  // "carry" field.
  int? _carry;
  int get carry => _carry ?? 0;
  set carry(int? val) => _carry = val;

  void incrementCarry(int amount) => carry = carry + amount;

  bool hasCarry() => _carry != null;

  // "product" field.
  int? _product;
  int get product => _product ?? 0;
  set product(int? val) => _product = val;

  void incrementProduct(int amount) => product = product + amount;

  bool hasProduct() => _product != null;

  static MultiplicationStepsStruct fromMap(Map<String, dynamic> data) =>
      MultiplicationStepsStruct(
        partialResult: castToType<int>(data['partialResult']),
        productDigit: castToType<int>(data['productDigit']),
        carry: castToType<int>(data['carry']),
        product: castToType<int>(data['product']),
      );

  static MultiplicationStepsStruct? maybeFromMap(dynamic data) => data is Map
      ? MultiplicationStepsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'partialResult': _partialResult,
        'productDigit': _productDigit,
        'carry': _carry,
        'product': _product,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'partialResult': serializeParam(
          _partialResult,
          ParamType.int,
        ),
        'productDigit': serializeParam(
          _productDigit,
          ParamType.int,
        ),
        'carry': serializeParam(
          _carry,
          ParamType.int,
        ),
        'product': serializeParam(
          _product,
          ParamType.int,
        ),
      }.withoutNulls;

  static MultiplicationStepsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MultiplicationStepsStruct(
        partialResult: deserializeParam(
          data['partialResult'],
          ParamType.int,
          false,
        ),
        productDigit: deserializeParam(
          data['productDigit'],
          ParamType.int,
          false,
        ),
        carry: deserializeParam(
          data['carry'],
          ParamType.int,
          false,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MultiplicationStepsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MultiplicationStepsStruct &&
        partialResult == other.partialResult &&
        productDigit == other.productDigit &&
        carry == other.carry &&
        product == other.product;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([partialResult, productDigit, carry, product]);
}

MultiplicationStepsStruct createMultiplicationStepsStruct({
  int? partialResult,
  int? productDigit,
  int? carry,
  int? product,
}) =>
    MultiplicationStepsStruct(
      partialResult: partialResult,
      productDigit: productDigit,
      carry: carry,
      product: product,
    );
