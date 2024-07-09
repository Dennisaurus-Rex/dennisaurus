// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobsmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobsModel _$JobsModelFromJson(Map<String, dynamic> json) {
  return _JobsModel.fromJson(json);
}

/// @nodoc
mixin _$JobsModel {
  String get title => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  List<String> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobsModelCopyWith<JobsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsModelCopyWith<$Res> {
  factory $JobsModelCopyWith(JobsModel value, $Res Function(JobsModel) then) =
      _$JobsModelCopyWithImpl<$Res, JobsModel>;
  @useResult
  $Res call(
      {String title,
      String company,
      String location,
      String from,
      String? to,
      List<String> tasks});
}

/// @nodoc
class _$JobsModelCopyWithImpl<$Res, $Val extends JobsModel>
    implements $JobsModelCopyWith<$Res> {
  _$JobsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? company = null,
    Object? location = null,
    Object? from = null,
    Object? to = freezed,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobsModelImplCopyWith<$Res>
    implements $JobsModelCopyWith<$Res> {
  factory _$$JobsModelImplCopyWith(
          _$JobsModelImpl value, $Res Function(_$JobsModelImpl) then) =
      __$$JobsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String company,
      String location,
      String from,
      String? to,
      List<String> tasks});
}

/// @nodoc
class __$$JobsModelImplCopyWithImpl<$Res>
    extends _$JobsModelCopyWithImpl<$Res, _$JobsModelImpl>
    implements _$$JobsModelImplCopyWith<$Res> {
  __$$JobsModelImplCopyWithImpl(
      _$JobsModelImpl _value, $Res Function(_$JobsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? company = null,
    Object? location = null,
    Object? from = null,
    Object? to = freezed,
    Object? tasks = null,
  }) {
    return _then(_$JobsModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobsModelImpl implements _JobsModel {
  _$JobsModelImpl(
      {required this.title,
      required this.company,
      required this.location,
      required this.from,
      this.to,
      required final List<String> tasks})
      : _tasks = tasks;

  factory _$JobsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobsModelImplFromJson(json);

  @override
  final String title;
  @override
  final String company;
  @override
  final String location;
  @override
  final String from;
  @override
  final String? to;
  final List<String> _tasks;
  @override
  List<String> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'JobsModel(title: $title, company: $company, location: $location, from: $from, to: $to, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobsModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, company, location, from,
      to, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobsModelImplCopyWith<_$JobsModelImpl> get copyWith =>
      __$$JobsModelImplCopyWithImpl<_$JobsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobsModelImplToJson(
      this,
    );
  }
}

abstract class _JobsModel implements JobsModel {
  factory _JobsModel(
      {required final String title,
      required final String company,
      required final String location,
      required final String from,
      final String? to,
      required final List<String> tasks}) = _$JobsModelImpl;

  factory _JobsModel.fromJson(Map<String, dynamic> json) =
      _$JobsModelImpl.fromJson;

  @override
  String get title;
  @override
  String get company;
  @override
  String get location;
  @override
  String get from;
  @override
  String? get to;
  @override
  List<String> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$JobsModelImplCopyWith<_$JobsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
