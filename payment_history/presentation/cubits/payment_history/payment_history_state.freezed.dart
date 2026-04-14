// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentHistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentHistoryState()';
}


}

/// @nodoc
class $PaymentHistoryStateCopyWith<$Res>  {
$PaymentHistoryStateCopyWith(PaymentHistoryState _, $Res Function(PaymentHistoryState) __);
}


/// Adds pattern-matching-related methods to [PaymentHistoryState].
extension PaymentHistoryStatePatterns on PaymentHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PaymentHistoryLoading value)?  loading,TResult Function( _PaymentHistoryLoaded value)?  loaded,TResult Function( _PaymentHistoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentHistoryLoading() when loading != null:
return loading(_that);case _PaymentHistoryLoaded() when loaded != null:
return loaded(_that);case _PaymentHistoryError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PaymentHistoryLoading value)  loading,required TResult Function( _PaymentHistoryLoaded value)  loaded,required TResult Function( _PaymentHistoryError value)  error,}){
final _that = this;
switch (_that) {
case _PaymentHistoryLoading():
return loading(_that);case _PaymentHistoryLoaded():
return loaded(_that);case _PaymentHistoryError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PaymentHistoryLoading value)?  loading,TResult? Function( _PaymentHistoryLoaded value)?  loaded,TResult? Function( _PaymentHistoryError value)?  error,}){
final _that = this;
switch (_that) {
case _PaymentHistoryLoading() when loading != null:
return loading(_that);case _PaymentHistoryLoaded() when loaded != null:
return loaded(_that);case _PaymentHistoryError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<PaymentHistoryModel> data)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentHistoryLoading() when loading != null:
return loading();case _PaymentHistoryLoaded() when loaded != null:
return loaded(_that.data);case _PaymentHistoryError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<PaymentHistoryModel> data)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _PaymentHistoryLoading():
return loading();case _PaymentHistoryLoaded():
return loaded(_that.data);case _PaymentHistoryError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<PaymentHistoryModel> data)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _PaymentHistoryLoading() when loading != null:
return loading();case _PaymentHistoryLoaded() when loaded != null:
return loaded(_that.data);case _PaymentHistoryError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentHistoryLoading implements PaymentHistoryState {
  const _PaymentHistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentHistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentHistoryState.loading()';
}


}




/// @nodoc


class _PaymentHistoryLoaded implements PaymentHistoryState {
  const _PaymentHistoryLoaded(final  List<PaymentHistoryModel> data): _data = data;
  

 final  List<PaymentHistoryModel> _data;
 List<PaymentHistoryModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of PaymentHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentHistoryLoadedCopyWith<_PaymentHistoryLoaded> get copyWith => __$PaymentHistoryLoadedCopyWithImpl<_PaymentHistoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentHistoryLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PaymentHistoryState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class _$PaymentHistoryLoadedCopyWith<$Res> implements $PaymentHistoryStateCopyWith<$Res> {
  factory _$PaymentHistoryLoadedCopyWith(_PaymentHistoryLoaded value, $Res Function(_PaymentHistoryLoaded) _then) = __$PaymentHistoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<PaymentHistoryModel> data
});




}
/// @nodoc
class __$PaymentHistoryLoadedCopyWithImpl<$Res>
    implements _$PaymentHistoryLoadedCopyWith<$Res> {
  __$PaymentHistoryLoadedCopyWithImpl(this._self, this._then);

  final _PaymentHistoryLoaded _self;
  final $Res Function(_PaymentHistoryLoaded) _then;

/// Create a copy of PaymentHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_PaymentHistoryLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PaymentHistoryModel>,
  ));
}


}

/// @nodoc


class _PaymentHistoryError implements PaymentHistoryState {
  const _PaymentHistoryError({required this.error});
  

 final  String error;

/// Create a copy of PaymentHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentHistoryErrorCopyWith<_PaymentHistoryError> get copyWith => __$PaymentHistoryErrorCopyWithImpl<_PaymentHistoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentHistoryError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PaymentHistoryState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$PaymentHistoryErrorCopyWith<$Res> implements $PaymentHistoryStateCopyWith<$Res> {
  factory _$PaymentHistoryErrorCopyWith(_PaymentHistoryError value, $Res Function(_PaymentHistoryError) _then) = __$PaymentHistoryErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$PaymentHistoryErrorCopyWithImpl<$Res>
    implements _$PaymentHistoryErrorCopyWith<$Res> {
  __$PaymentHistoryErrorCopyWithImpl(this._self, this._then);

  final _PaymentHistoryError _self;
  final $Res Function(_PaymentHistoryError) _then;

/// Create a copy of PaymentHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_PaymentHistoryError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
