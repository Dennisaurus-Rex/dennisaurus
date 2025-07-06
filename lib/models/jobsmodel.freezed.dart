// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobsmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobsModel {
  String get title;
  String get company;
  String get location;
  String get from;
  String? get to;
  List<String> get tasks;

  /// Create a copy of JobsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JobsModelCopyWith<JobsModel> get copyWith =>
      _$JobsModelCopyWithImpl<JobsModel>(this as JobsModel, _$identity);

  /// Serializes this JobsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JobsModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, company, location, from,
      to, const DeepCollectionEquality().hash(tasks));

  @override
  String toString() {
    return 'JobsModel(title: $title, company: $company, location: $location, from: $from, to: $to, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $JobsModelCopyWith<$Res> {
  factory $JobsModelCopyWith(JobsModel value, $Res Function(JobsModel) _then) =
      _$JobsModelCopyWithImpl;
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
class _$JobsModelCopyWithImpl<$Res> implements $JobsModelCopyWith<$Res> {
  _$JobsModelCopyWithImpl(this._self, this._then);

  final JobsModel _self;
  final $Res Function(JobsModel) _then;

  /// Create a copy of JobsModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [JobsModel].
extension JobsModelPatterns on JobsModel {
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
    TResult Function(_JobsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _JobsModel() when $default != null:
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
    TResult Function(_JobsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsModel():
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
    TResult? Function(_JobsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsModel() when $default != null:
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
    TResult Function(String title, String company, String location, String from,
            String? to, List<String> tasks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _JobsModel() when $default != null:
        return $default(_that.title, _that.company, _that.location, _that.from,
            _that.to, _that.tasks);
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
    TResult Function(String title, String company, String location, String from,
            String? to, List<String> tasks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsModel():
        return $default(_that.title, _that.company, _that.location, _that.from,
            _that.to, _that.tasks);
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
    TResult? Function(String title, String company, String location,
            String from, String? to, List<String> tasks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JobsModel() when $default != null:
        return $default(_that.title, _that.company, _that.location, _that.from,
            _that.to, _that.tasks);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _JobsModel implements JobsModel {
  _JobsModel(
      {required this.title,
      required this.company,
      required this.location,
      required this.from,
      this.to,
      required final List<String> tasks})
      : _tasks = tasks;
  factory _JobsModel.fromJson(Map<String, dynamic> json) =>
      _$JobsModelFromJson(json);

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

  /// Create a copy of JobsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JobsModelCopyWith<_JobsModel> get copyWith =>
      __$JobsModelCopyWithImpl<_JobsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JobsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JobsModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, company, location, from,
      to, const DeepCollectionEquality().hash(_tasks));

  @override
  String toString() {
    return 'JobsModel(title: $title, company: $company, location: $location, from: $from, to: $to, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class _$JobsModelCopyWith<$Res>
    implements $JobsModelCopyWith<$Res> {
  factory _$JobsModelCopyWith(
          _JobsModel value, $Res Function(_JobsModel) _then) =
      __$JobsModelCopyWithImpl;
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
class __$JobsModelCopyWithImpl<$Res> implements _$JobsModelCopyWith<$Res> {
  __$JobsModelCopyWithImpl(this._self, this._then);

  final _JobsModel _self;
  final $Res Function(_JobsModel) _then;

  /// Create a copy of JobsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? company = null,
    Object? location = null,
    Object? from = null,
    Object? to = freezed,
    Object? tasks = null,
  }) {
    return _then(_JobsModel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
