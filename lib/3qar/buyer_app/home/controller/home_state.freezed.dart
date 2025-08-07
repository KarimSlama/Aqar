// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  HomeDataState get propertyStatus => throw _privateConstructorUsedError;
  HomeDataState get unitsStatus => throw _privateConstructorUsedError;
  PageViewState? get pageChanged => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  List<UnitRequestModel> get unitsData => throw _privateConstructorUsedError;
  List<PropertyDetailsModel> get propertiesData =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {HomeDataState propertyStatus,
      HomeDataState unitsStatus,
      PageViewState? pageChanged,
      int currentIndex,
      List<UnitRequestModel> unitsData,
      List<PropertyDetailsModel> propertiesData,
      String? errorMessage});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyStatus = null,
    Object? unitsStatus = null,
    Object? pageChanged = freezed,
    Object? currentIndex = null,
    Object? unitsData = null,
    Object? propertiesData = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      propertyStatus: null == propertyStatus
          ? _value.propertyStatus
          : propertyStatus // ignore: cast_nullable_to_non_nullable
              as HomeDataState,
      unitsStatus: null == unitsStatus
          ? _value.unitsStatus
          : unitsStatus // ignore: cast_nullable_to_non_nullable
              as HomeDataState,
      pageChanged: freezed == pageChanged
          ? _value.pageChanged
          : pageChanged // ignore: cast_nullable_to_non_nullable
              as PageViewState?,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      unitsData: null == unitsData
          ? _value.unitsData
          : unitsData // ignore: cast_nullable_to_non_nullable
              as List<UnitRequestModel>,
      propertiesData: null == propertiesData
          ? _value.propertiesData
          : propertiesData // ignore: cast_nullable_to_non_nullable
              as List<PropertyDetailsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeDataState propertyStatus,
      HomeDataState unitsStatus,
      PageViewState? pageChanged,
      int currentIndex,
      List<UnitRequestModel> unitsData,
      List<PropertyDetailsModel> propertiesData,
      String? errorMessage});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyStatus = null,
    Object? unitsStatus = null,
    Object? pageChanged = freezed,
    Object? currentIndex = null,
    Object? unitsData = null,
    Object? propertiesData = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$HomeStateImpl(
      propertyStatus: null == propertyStatus
          ? _value.propertyStatus
          : propertyStatus // ignore: cast_nullable_to_non_nullable
              as HomeDataState,
      unitsStatus: null == unitsStatus
          ? _value.unitsStatus
          : unitsStatus // ignore: cast_nullable_to_non_nullable
              as HomeDataState,
      pageChanged: freezed == pageChanged
          ? _value.pageChanged
          : pageChanged // ignore: cast_nullable_to_non_nullable
              as PageViewState?,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      unitsData: null == unitsData
          ? _value._unitsData
          : unitsData // ignore: cast_nullable_to_non_nullable
              as List<UnitRequestModel>,
      propertiesData: null == propertiesData
          ? _value._propertiesData
          : propertiesData // ignore: cast_nullable_to_non_nullable
              as List<PropertyDetailsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.propertyStatus = HomeDataState.loading,
      this.unitsStatus = HomeDataState.loading,
      this.pageChanged,
      this.currentIndex = 0,
      final List<UnitRequestModel> unitsData = const [],
      final List<PropertyDetailsModel> propertiesData = const [],
      this.errorMessage})
      : _unitsData = unitsData,
        _propertiesData = propertiesData;

  @override
  @JsonKey()
  final HomeDataState propertyStatus;
  @override
  @JsonKey()
  final HomeDataState unitsStatus;
  @override
  final PageViewState? pageChanged;
  @override
  @JsonKey()
  final int currentIndex;
  final List<UnitRequestModel> _unitsData;
  @override
  @JsonKey()
  List<UnitRequestModel> get unitsData {
    if (_unitsData is EqualUnmodifiableListView) return _unitsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unitsData);
  }

  final List<PropertyDetailsModel> _propertiesData;
  @override
  @JsonKey()
  List<PropertyDetailsModel> get propertiesData {
    if (_propertiesData is EqualUnmodifiableListView) return _propertiesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_propertiesData);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(propertyStatus: $propertyStatus, unitsStatus: $unitsStatus, pageChanged: $pageChanged, currentIndex: $currentIndex, unitsData: $unitsData, propertiesData: $propertiesData, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.propertyStatus, propertyStatus) ||
                other.propertyStatus == propertyStatus) &&
            (identical(other.unitsStatus, unitsStatus) ||
                other.unitsStatus == unitsStatus) &&
            (identical(other.pageChanged, pageChanged) ||
                other.pageChanged == pageChanged) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other._unitsData, _unitsData) &&
            const DeepCollectionEquality()
                .equals(other._propertiesData, _propertiesData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      propertyStatus,
      unitsStatus,
      pageChanged,
      currentIndex,
      const DeepCollectionEquality().hash(_unitsData),
      const DeepCollectionEquality().hash(_propertiesData),
      errorMessage);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final HomeDataState propertyStatus,
      final HomeDataState unitsStatus,
      final PageViewState? pageChanged,
      final int currentIndex,
      final List<UnitRequestModel> unitsData,
      final List<PropertyDetailsModel> propertiesData,
      final String? errorMessage}) = _$HomeStateImpl;

  @override
  HomeDataState get propertyStatus;
  @override
  HomeDataState get unitsStatus;
  @override
  PageViewState? get pageChanged;
  @override
  int get currentIndex;
  @override
  List<UnitRequestModel> get unitsData;
  @override
  List<PropertyDetailsModel> get propertiesData;
  @override
  String? get errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
