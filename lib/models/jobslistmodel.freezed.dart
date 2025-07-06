// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobslistmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobsListModel {
  List<JobsModel> get jobs;

  /// Create a copy of JobsListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JobsListModelCopyWith<JobsListModel> get copyWith =>
      _$JobsListModelCopyWithImpl<JobsListModel>(
          this as JobsListModel, _$identity);

  /// Serializes this JobsListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JobsListModel &&
            const DeepCollectionEquality().equals(other.jobs, jobs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(jobs));

  @override
  String toString() {
    return 'JobsListModel(jobs: $jobs)';
  }
}

/// @nodoc
abstract mixin class $JobsListModelCopyWith<$Res> {
  factory $JobsListModelCopyWith(
          JobsListModel value, $Res Function(JobsListModel) _then) =
      _$JobsListModelCopyWithImpl;
  @useResult
  $Res call({List<JobsModel> jobs});
}

/// @nodoc
class _$JobsListModelCopyWithImpl<$Res>
    implements $JobsListModelCopyWith<$Res> {
  _$JobsListModelCopyWithImpl(this._self, this._then);

  final JobsListModel _self;
  final $Res Function(JobsListModel) _then;

  /// Create a copy of JobsListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_self.copyWith(
      jobs: null == jobs
          ? _self.jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobsModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [JobsListModel].
extension JobsListModelPatterns on JobsListModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_JobsListModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _JobsListModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_JobsListModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsListModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_JobsListModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsListModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<JobsModel> jobs)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _JobsListModel() when $default != null:
        return $default(_that.jobs);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<JobsModel> jobs) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsListModel():
        return $default(_that.jobs);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<JobsModel> jobs)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsListModel() when $default != null:
        return $default(_that.jobs);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _JobsListModel implements JobsListModel {
  _JobsListModel({required final List<JobsModel> jobs}) : _jobs = jobs;
  factory _JobsListModel.fromJson(Map<String, dynamic> json) =>
      _$JobsListModelFromJson(json);

  final List<JobsModel> _jobs;
  @override
  List<JobsModel> get jobs {
    if (_jobs is EqualUnmodifiableListView) return _jobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobs);
  }

  /// Create a copy of JobsListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JobsListModelCopyWith<_JobsListModel> get copyWith =>
      __$JobsListModelCopyWithImpl<_JobsListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JobsListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JobsListModel &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_jobs));

  @override
  String toString() {
    return 'JobsListModel(jobs: $jobs)';
  }
}

/// @nodoc
abstract mixin class _$JobsListModelCopyWith<$Res>
    implements $JobsListModelCopyWith<$Res> {
  factory _$JobsListModelCopyWith(
          _JobsListModel value, $Res Function(_JobsListModel) _then) =
      __$JobsListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<JobsModel> jobs});
}

/// @nodoc
class __$JobsListModelCopyWithImpl<$Res>
    implements _$JobsListModelCopyWith<$Res> {
  __$JobsListModelCopyWithImpl(this._self, this._then);

  final _JobsListModel _self;
  final $Res Function(_JobsListModel) _then;

  /// Create a copy of JobsListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_JobsListModel(
      jobs: null == jobs
          ? _self._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobsModel>,
    ));
  }
}

// dart format on
