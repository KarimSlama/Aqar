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
  ProfileDataState get profileDataStatus => throw _privateConstructorUsedError;
  ProfileDataState get sellerRatingStatus => throw _privateConstructorUsedError;
  ProfileUpdateDataState get editAboutMeEnabled =>
      throw _privateConstructorUsedError;
  UserModel get userData => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  List<SellerRatingModel> get sellerRatingData =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

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
      {ProfileDataState profileDataStatus,
      ProfileDataState sellerRatingStatus,
      ProfileUpdateDataState editAboutMeEnabled,
      UserModel userData,
      bool isEnabled,
      List<SellerRatingModel> sellerRatingData,
      String? errorMessage});
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
    Object? profileDataStatus = null,
    Object? sellerRatingStatus = null,
    Object? editAboutMeEnabled = null,
    Object? userData = null,
    Object? isEnabled = null,
    Object? sellerRatingData = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      profileDataStatus: null == profileDataStatus
          ? _value.profileDataStatus
          : profileDataStatus // ignore: cast_nullable_to_non_nullable
              as ProfileDataState,
      sellerRatingStatus: null == sellerRatingStatus
          ? _value.sellerRatingStatus
          : sellerRatingStatus // ignore: cast_nullable_to_non_nullable
              as ProfileDataState,
      editAboutMeEnabled: null == editAboutMeEnabled
          ? _value.editAboutMeEnabled
          : editAboutMeEnabled // ignore: cast_nullable_to_non_nullable
              as ProfileUpdateDataState,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerRatingData: null == sellerRatingData
          ? _value.sellerRatingData
          : sellerRatingData // ignore: cast_nullable_to_non_nullable
              as List<SellerRatingModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {ProfileDataState profileDataStatus,
      ProfileDataState sellerRatingStatus,
      ProfileUpdateDataState editAboutMeEnabled,
      UserModel userData,
      bool isEnabled,
      List<SellerRatingModel> sellerRatingData,
      String? errorMessage});
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
    Object? profileDataStatus = null,
    Object? sellerRatingStatus = null,
    Object? editAboutMeEnabled = null,
    Object? userData = null,
    Object? isEnabled = null,
    Object? sellerRatingData = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      profileDataStatus: null == profileDataStatus
          ? _value.profileDataStatus
          : profileDataStatus // ignore: cast_nullable_to_non_nullable
              as ProfileDataState,
      sellerRatingStatus: null == sellerRatingStatus
          ? _value.sellerRatingStatus
          : sellerRatingStatus // ignore: cast_nullable_to_non_nullable
              as ProfileDataState,
      editAboutMeEnabled: null == editAboutMeEnabled
          ? _value.editAboutMeEnabled
          : editAboutMeEnabled // ignore: cast_nullable_to_non_nullable
              as ProfileUpdateDataState,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sellerRatingData: null == sellerRatingData
          ? _value._sellerRatingData
          : sellerRatingData // ignore: cast_nullable_to_non_nullable
              as List<SellerRatingModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.profileDataStatus = ProfileDataState.loading,
      this.sellerRatingStatus = ProfileDataState.loading,
      this.editAboutMeEnabled = ProfileUpdateDataState.enabled,
      this.userData = UserModel.empty,
      this.isEnabled = false,
      final List<SellerRatingModel> sellerRatingData = const [],
      this.errorMessage})
      : _sellerRatingData = sellerRatingData;

  @override
  @JsonKey()
  final ProfileDataState profileDataStatus;
  @override
  @JsonKey()
  final ProfileDataState sellerRatingStatus;
  @override
  @JsonKey()
  final ProfileUpdateDataState editAboutMeEnabled;
  @override
  @JsonKey()
  final UserModel userData;
  @override
  @JsonKey()
  final bool isEnabled;
  final List<SellerRatingModel> _sellerRatingData;
  @override
  @JsonKey()
  List<SellerRatingModel> get sellerRatingData {
    if (_sellerRatingData is EqualUnmodifiableListView)
      return _sellerRatingData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sellerRatingData);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProfileState(profileDataStatus: $profileDataStatus, sellerRatingStatus: $sellerRatingStatus, editAboutMeEnabled: $editAboutMeEnabled, userData: $userData, isEnabled: $isEnabled, sellerRatingData: $sellerRatingData, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.profileDataStatus, profileDataStatus) ||
                other.profileDataStatus == profileDataStatus) &&
            (identical(other.sellerRatingStatus, sellerRatingStatus) ||
                other.sellerRatingStatus == sellerRatingStatus) &&
            (identical(other.editAboutMeEnabled, editAboutMeEnabled) ||
                other.editAboutMeEnabled == editAboutMeEnabled) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            const DeepCollectionEquality()
                .equals(other._sellerRatingData, _sellerRatingData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      profileDataStatus,
      sellerRatingStatus,
      editAboutMeEnabled,
      userData,
      isEnabled,
      const DeepCollectionEquality().hash(_sellerRatingData),
      errorMessage);

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
      {final ProfileDataState profileDataStatus,
      final ProfileDataState sellerRatingStatus,
      final ProfileUpdateDataState editAboutMeEnabled,
      final UserModel userData,
      final bool isEnabled,
      final List<SellerRatingModel> sellerRatingData,
      final String? errorMessage}) = _$ProfileStateImpl;

  @override
  ProfileDataState get profileDataStatus;
  @override
  ProfileDataState get sellerRatingStatus;
  @override
  ProfileUpdateDataState get editAboutMeEnabled;
  @override
  UserModel get userData;
  @override
  bool get isEnabled;
  @override
  List<SellerRatingModel> get sellerRatingData;
  @override
  String? get errorMessage;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
