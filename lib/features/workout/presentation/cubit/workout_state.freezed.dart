// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkOutState {
// General states
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  String? get errorState => throw _privateConstructorUsedError; // WorkOut data
// UserEntity? userData,
  List<WorkOutEntity>? get workOutList => throw _privateConstructorUsedError;
  List<WorkOutEntity>? get workOutListIntial =>
      throw _privateConstructorUsedError;
  List<String> get workOutBodyPartsList => throw _privateConstructorUsedError;
  List<String> get workOutLevelsList => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Create a copy of WorkOutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkOutStateCopyWith<WorkOutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOutStateCopyWith<$Res> {
  factory $WorkOutStateCopyWith(
          WorkOutState value, $Res Function(WorkOutState) then) =
      _$WorkOutStateCopyWithImpl<$Res, WorkOutState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      String? errorState,
      List<WorkOutEntity>? workOutList,
      List<WorkOutEntity>? workOutListIntial,
      List<String> workOutBodyPartsList,
      List<String> workOutLevelsList,
      String? token});
}

/// @nodoc
class _$WorkOutStateCopyWithImpl<$Res, $Val extends WorkOutState>
    implements $WorkOutStateCopyWith<$Res> {
  _$WorkOutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkOutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? workOutList = freezed,
    Object? workOutListIntial = freezed,
    Object? workOutBodyPartsList = null,
    Object? workOutLevelsList = null,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      isLoadingState: null == isLoadingState
          ? _value.isLoadingState
          : isLoadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessState: null == isSuccessState
          ? _value.isSuccessState
          : isSuccessState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: freezed == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String?,
      workOutList: freezed == workOutList
          ? _value.workOutList
          : workOutList // ignore: cast_nullable_to_non_nullable
              as List<WorkOutEntity>?,
      workOutListIntial: freezed == workOutListIntial
          ? _value.workOutListIntial
          : workOutListIntial // ignore: cast_nullable_to_non_nullable
              as List<WorkOutEntity>?,
      workOutBodyPartsList: null == workOutBodyPartsList
          ? _value.workOutBodyPartsList
          : workOutBodyPartsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workOutLevelsList: null == workOutLevelsList
          ? _value.workOutLevelsList
          : workOutLevelsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkOutStateImplCopyWith<$Res>
    implements $WorkOutStateCopyWith<$Res> {
  factory _$$WorkOutStateImplCopyWith(
          _$WorkOutStateImpl value, $Res Function(_$WorkOutStateImpl) then) =
      __$$WorkOutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      String? errorState,
      List<WorkOutEntity>? workOutList,
      List<WorkOutEntity>? workOutListIntial,
      List<String> workOutBodyPartsList,
      List<String> workOutLevelsList,
      String? token});
}

/// @nodoc
class __$$WorkOutStateImplCopyWithImpl<$Res>
    extends _$WorkOutStateCopyWithImpl<$Res, _$WorkOutStateImpl>
    implements _$$WorkOutStateImplCopyWith<$Res> {
  __$$WorkOutStateImplCopyWithImpl(
      _$WorkOutStateImpl _value, $Res Function(_$WorkOutStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkOutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? workOutList = freezed,
    Object? workOutListIntial = freezed,
    Object? workOutBodyPartsList = null,
    Object? workOutLevelsList = null,
    Object? token = freezed,
  }) {
    return _then(_$WorkOutStateImpl(
      isLoadingState: null == isLoadingState
          ? _value.isLoadingState
          : isLoadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessState: null == isSuccessState
          ? _value.isSuccessState
          : isSuccessState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: freezed == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String?,
      workOutList: freezed == workOutList
          ? _value._workOutList
          : workOutList // ignore: cast_nullable_to_non_nullable
              as List<WorkOutEntity>?,
      workOutListIntial: freezed == workOutListIntial
          ? _value._workOutListIntial
          : workOutListIntial // ignore: cast_nullable_to_non_nullable
              as List<WorkOutEntity>?,
      workOutBodyPartsList: null == workOutBodyPartsList
          ? _value._workOutBodyPartsList
          : workOutBodyPartsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workOutLevelsList: null == workOutLevelsList
          ? _value._workOutLevelsList
          : workOutLevelsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WorkOutStateImpl implements _WorkOutState {
  const _$WorkOutStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      final List<WorkOutEntity>? workOutList,
      final List<WorkOutEntity>? workOutListIntial,
      final List<String> workOutBodyPartsList = const ['All'],
      final List<String> workOutLevelsList = const ['All'],
      this.token})
      : _workOutList = workOutList,
        _workOutListIntial = workOutListIntial,
        _workOutBodyPartsList = workOutBodyPartsList,
        _workOutLevelsList = workOutLevelsList;

// General states
  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final String? errorState;
// WorkOut data
// UserEntity? userData,
  final List<WorkOutEntity>? _workOutList;
// WorkOut data
// UserEntity? userData,
  @override
  List<WorkOutEntity>? get workOutList {
    final value = _workOutList;
    if (value == null) return null;
    if (_workOutList is EqualUnmodifiableListView) return _workOutList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WorkOutEntity>? _workOutListIntial;
  @override
  List<WorkOutEntity>? get workOutListIntial {
    final value = _workOutListIntial;
    if (value == null) return null;
    if (_workOutListIntial is EqualUnmodifiableListView)
      return _workOutListIntial;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _workOutBodyPartsList;
  @override
  @JsonKey()
  List<String> get workOutBodyPartsList {
    if (_workOutBodyPartsList is EqualUnmodifiableListView)
      return _workOutBodyPartsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOutBodyPartsList);
  }

  final List<String> _workOutLevelsList;
  @override
  @JsonKey()
  List<String> get workOutLevelsList {
    if (_workOutLevelsList is EqualUnmodifiableListView)
      return _workOutLevelsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workOutLevelsList);
  }

  @override
  final String? token;

  @override
  String toString() {
    return 'WorkOutState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, workOutList: $workOutList, workOutListIntial: $workOutListIntial, workOutBodyPartsList: $workOutBodyPartsList, workOutLevelsList: $workOutLevelsList, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOutStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            const DeepCollectionEquality()
                .equals(other._workOutList, _workOutList) &&
            const DeepCollectionEquality()
                .equals(other._workOutListIntial, _workOutListIntial) &&
            const DeepCollectionEquality()
                .equals(other._workOutBodyPartsList, _workOutBodyPartsList) &&
            const DeepCollectionEquality()
                .equals(other._workOutLevelsList, _workOutLevelsList) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingState,
      isSuccessState,
      errorState,
      const DeepCollectionEquality().hash(_workOutList),
      const DeepCollectionEquality().hash(_workOutListIntial),
      const DeepCollectionEquality().hash(_workOutBodyPartsList),
      const DeepCollectionEquality().hash(_workOutLevelsList),
      token);

  /// Create a copy of WorkOutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOutStateImplCopyWith<_$WorkOutStateImpl> get copyWith =>
      __$$WorkOutStateImplCopyWithImpl<_$WorkOutStateImpl>(this, _$identity);
}

abstract class _WorkOutState implements WorkOutState {
  const factory _WorkOutState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final String? errorState,
      final List<WorkOutEntity>? workOutList,
      final List<WorkOutEntity>? workOutListIntial,
      final List<String> workOutBodyPartsList,
      final List<String> workOutLevelsList,
      final String? token}) = _$WorkOutStateImpl;

// General states
  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  String? get errorState; // WorkOut data
// UserEntity? userData,
  @override
  List<WorkOutEntity>? get workOutList;
  @override
  List<WorkOutEntity>? get workOutListIntial;
  @override
  List<String> get workOutBodyPartsList;
  @override
  List<String> get workOutLevelsList;
  @override
  String? get token;

  /// Create a copy of WorkOutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkOutStateImplCopyWith<_$WorkOutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
