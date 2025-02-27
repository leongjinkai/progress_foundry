// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignmentStruct extends BaseStruct {
  AssignmentStruct({
    String? category,
    double? progress,
    double? rating,
    QnType? type,
  })  : _category = category,
        _progress = progress,
        _rating = rating,
        _type = type;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;

  void incrementProgress(double amount) => progress = progress + amount;

  bool hasProgress() => _progress != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;

  void incrementRating(double amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "type" field.
  QnType? _type;
  QnType? get type => _type;
  set type(QnType? val) => _type = val;

  bool hasType() => _type != null;

  static AssignmentStruct fromMap(Map<String, dynamic> data) =>
      AssignmentStruct(
        category: data['category'] as String?,
        progress: castToType<double>(data['progress']),
        rating: castToType<double>(data['rating']),
        type: data['type'] is QnType
            ? data['type']
            : deserializeEnum<QnType>(data['type']),
      );

  static AssignmentStruct? maybeFromMap(dynamic data) => data is Map
      ? AssignmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'progress': _progress,
        'rating': _rating,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static AssignmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssignmentStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.double,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        type: deserializeParam<QnType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'AssignmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssignmentStruct &&
        category == other.category &&
        progress == other.progress &&
        rating == other.rating &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([category, progress, rating, type]);
}

AssignmentStruct createAssignmentStruct({
  String? category,
  double? progress,
  double? rating,
  QnType? type,
}) =>
    AssignmentStruct(
      category: category,
      progress: progress,
      rating: rating,
      type: type,
    );
