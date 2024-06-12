// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobslistmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobsListModel _$JobsListModelFromJson(Map<String, dynamic> json) {
  return _JobsListModel.fromJson(json);
}

/// @nodoc
mixin _$JobsListModel {
  List<JobsModel> get jobs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobsListModelCopyWith<JobsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsListModelCopyWith<$Res> {
  factory $JobsListModelCopyWith(
          JobsListModel value, $Res Function(JobsListModel) then) =
      _$JobsListModelCopyWithImpl<$Res, JobsListModel>;
  @useResult
  $Res call({List<JobsModel> jobs});
}

/// @nodoc
class _$JobsListModelCopyWithImpl<$Res, $Val extends JobsListModel>
    implements $JobsListModelCopyWith<$Res> {
  _$JobsListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_value.copyWith(
      jobs: null == jobs
          ? _value.jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobsListModelCopyWith<$Res>
    implements $JobsListModelCopyWith<$Res> {
  factory _$$_JobsListModelCopyWith(
          _$_JobsListModel value, $Res Function(_$_JobsListModel) then) =
      __$$_JobsListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JobsModel> jobs});
}

/// @nodoc
class __$$_JobsListModelCopyWithImpl<$Res>
    extends _$JobsListModelCopyWithImpl<$Res, _$_JobsListModel>
    implements _$$_JobsListModelCopyWith<$Res> {
  __$$_JobsListModelCopyWithImpl(
      _$_JobsListModel _value, $Res Function(_$_JobsListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_$_JobsListModel(
      jobs: null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobsListModel implements _JobsListModel {
  _$_JobsListModel({required final List<JobsModel> jobs}) : _jobs = jobs;

  factory _$_JobsListModel.fromJson(Map<String, dynamic> json) =>
      _$$_JobsListModelFromJson(json);

  final List<JobsModel> _jobs;
  @override
  List<JobsModel> get jobs {
    if (_jobs is EqualUnmodifiableListView) return _jobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobs);
  }

  @override
  String toString() {
    return 'JobsListModel(jobs: $jobs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobsListModel &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_jobs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobsListModelCopyWith<_$_JobsListModel> get copyWith =>
      __$$_JobsListModelCopyWithImpl<_$_JobsListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobsListModelToJson(
      this,
    );
  }
}

abstract class _JobsListModel implements JobsListModel {
  factory _JobsListModel({required final List<JobsModel> jobs}) =
      _$_JobsListModel;

  factory _JobsListModel.fromJson(Map<String, dynamic> json) =
      _$_JobsListModel.fromJson;

  @override
  List<JobsModel> get jobs;
  @override
  @JsonKey(ignore: true)
  _$$_JobsListModelCopyWith<_$_JobsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
