// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
// General states
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  String? get errorState => throw _privateConstructorUsedError; // Profile data
  UserEntity? get userData =>
      throw _privateConstructorUsedError; // ProfileEntity? profileData,
// Image states
  String? get profileImagePath => throw _privateConstructorUsedError;
  String? get selectedImagePath => throw _privateConstructorUsedError;
  bool get isImageUploading =>
      throw _privateConstructorUsedError; // Form states
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError; // Validation states
  bool get isNameValid => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      String? errorState,
      UserEntity? userData,
      String? profileImagePath,
      String? selectedImagePath,
      bool isImageUploading,
      String name,
      String email,
      int points,
      bool isNameValid,
      bool isFormValid});

  $UserEntityCopyWith<$Res>? get userData;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? userData = freezed,
    Object? profileImagePath = freezed,
    Object? selectedImagePath = freezed,
    Object? isImageUploading = null,
    Object? name = null,
    Object? email = null,
    Object? points = null,
    Object? isNameValid = null,
    Object? isFormValid = null,
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
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      profileImagePath: freezed == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedImagePath: freezed == selectedImagePath
          ? _value.selectedImagePath
          : selectedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isImageUploading: null == isImageUploading
          ? _value.isImageUploading
          : isImageUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      isNameValid: null == isNameValid
          ? _value.isNameValid
          : isNameValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      String? errorState,
      UserEntity? userData,
      String? profileImagePath,
      String? selectedImagePath,
      bool isImageUploading,
      String name,
      String email,
      int points,
      bool isNameValid,
      bool isFormValid});

  @override
  $UserEntityCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? userData = freezed,
    Object? profileImagePath = freezed,
    Object? selectedImagePath = freezed,
    Object? isImageUploading = null,
    Object? name = null,
    Object? email = null,
    Object? points = null,
    Object? isNameValid = null,
    Object? isFormValid = null,
  }) {
    return _then(_$ProfileStateImpl(
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
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      profileImagePath: freezed == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedImagePath: freezed == selectedImagePath
          ? _value.selectedImagePath
          : selectedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isImageUploading: null == isImageUploading
          ? _value.isImageUploading
          : isImageUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      isNameValid: null == isNameValid
          ? _value.isNameValid
          : isNameValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      this.userData,
      this.profileImagePath,
      this.selectedImagePath,
      this.isImageUploading = false,
      this.name = '',
      this.email = '',
      this.points = 0,
      this.isNameValid = false,
      this.isFormValid = false});

// General states
  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final String? errorState;
// Profile data
  @override
  final UserEntity? userData;
// ProfileEntity? profileData,
// Image states
  @override
  final String? profileImagePath;
  @override
  final String? selectedImagePath;
  @override
  @JsonKey()
  final bool isImageUploading;
// Form states
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final int points;
// Validation states
  @override
  @JsonKey()
  final bool isNameValid;
  @override
  @JsonKey()
  final bool isFormValid;

  @override
  String toString() {
    return 'ProfileState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, userData: $userData, profileImagePath: $profileImagePath, selectedImagePath: $selectedImagePath, isImageUploading: $isImageUploading, name: $name, email: $email, points: $points, isNameValid: $isNameValid, isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.profileImagePath, profileImagePath) ||
                other.profileImagePath == profileImagePath) &&
            (identical(other.selectedImagePath, selectedImagePath) ||
                other.selectedImagePath == selectedImagePath) &&
            (identical(other.isImageUploading, isImageUploading) ||
                other.isImageUploading == isImageUploading) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.isNameValid, isNameValid) ||
                other.isNameValid == isNameValid) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingState,
      isSuccessState,
      errorState,
      userData,
      profileImagePath,
      selectedImagePath,
      isImageUploading,
      name,
      email,
      points,
      isNameValid,
      isFormValid);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final String? errorState,
      final UserEntity? userData,
      final String? profileImagePath,
      final String? selectedImagePath,
      final bool isImageUploading,
      final String name,
      final String email,
      final int points,
      final bool isNameValid,
      final bool isFormValid}) = _$ProfileStateImpl;

// General states
  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  String? get errorState; // Profile data
  @override
  UserEntity? get userData; // ProfileEntity? profileData,
// Image states
  @override
  String? get profileImagePath;
  @override
  String? get selectedImagePath;
  @override
  bool get isImageUploading; // Form states
  @override
  String get name;
  @override
  String get email;
  @override
  int get points; // Validation states
  @override
  bool get isNameValid;
  @override
  bool get isFormValid;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
