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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$JobsListModelImplCopyWith<$Res>
    implements $JobsListModelCopyWith<$Res> {
  factory _$$JobsListModelImplCopyWith(
          _$JobsListModelImpl value, $Res Function(_$JobsListModelImpl) then) =
      __$$JobsListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JobsModel> jobs});
}

/// @nodoc
class __$$JobsListModelImplCopyWithImpl<$Res>
    extends _$JobsListModelCopyWithImpl<$Res, _$JobsListModelImpl>
    implements _$$JobsListModelImplCopyWith<$Res> {
  __$$JobsListModelImplCopyWithImpl(
      _$JobsListModelImpl _value, $Res Function(_$JobsListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_$JobsListModelImpl(
      jobs: null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobsListModelImpl implements _JobsListModel {
  _$JobsListModelImpl({required final List<JobsModel> jobs}) : _jobs = jobs;

  factory _$JobsListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobsListModelImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobsListModelImpl &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_jobs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobsListModelImplCopyWith<_$JobsListModelImpl> get copyWith =>
      __$$JobsListModelImplCopyWithImpl<_$JobsListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobsListModelImplToJson(
      this,
    );
  }
}

abstract class _JobsListModel implements JobsListModel {
  factory _JobsListModel({required final List<JobsModel> jobs}) =
      _$JobsListModelImpl;

  factory _JobsListModel.fromJson(Map<String, dynamic> json) =
      _$JobsListModelImpl.fromJson;

  @override
  List<JobsModel> get jobs;
  @override
  @JsonKey(ignore: true)
  _$$JobsListModelImplCopyWith<_$JobsListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
