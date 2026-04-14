// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentHistoryModel {

@JsonKey(name: 'receipt_number') String get receiptNumber;@JsonKey(name: 'transaction_date') int get transactionDate; String get id;@JsonKey(name: 'contractor_id') String get contractorId;@JsonKey(name: 'transaction_id') String get transactionId; int get amount;@JsonKey(name: 'park_id') int get parkId; String get status;@JsonKey(name: 'bank_logo_url') String? get bankLogoUrl;
/// Create a copy of PaymentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentHistoryModelCopyWith<PaymentHistoryModel> get copyWith => _$PaymentHistoryModelCopyWithImpl<PaymentHistoryModel>(this as PaymentHistoryModel, _$identity);

  /// Serializes this PaymentHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentHistoryModel&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.id, id) || other.id == id)&&(identical(other.contractorId, contractorId) || other.contractorId == contractorId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.parkId, parkId) || other.parkId == parkId)&&(identical(other.status, status) || other.status == status)&&(identical(other.bankLogoUrl, bankLogoUrl) || other.bankLogoUrl == bankLogoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptNumber,transactionDate,id,contractorId,transactionId,amount,parkId,status,bankLogoUrl);

@override
String toString() {
  return 'PaymentHistoryModel(receiptNumber: $receiptNumber, transactionDate: $transactionDate, id: $id, contractorId: $contractorId, transactionId: $transactionId, amount: $amount, parkId: $parkId, status: $status, bankLogoUrl: $bankLogoUrl)';
}


}

/// @nodoc
abstract mixin class $PaymentHistoryModelCopyWith<$Res>  {
  factory $PaymentHistoryModelCopyWith(PaymentHistoryModel value, $Res Function(PaymentHistoryModel) _then) = _$PaymentHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'receipt_number') String receiptNumber,@JsonKey(name: 'transaction_date') int transactionDate, String id,@JsonKey(name: 'contractor_id') String contractorId,@JsonKey(name: 'transaction_id') String transactionId, int amount,@JsonKey(name: 'park_id') int parkId, String status,@JsonKey(name: 'bank_logo_url') String? bankLogoUrl
});




}
/// @nodoc
class _$PaymentHistoryModelCopyWithImpl<$Res>
    implements $PaymentHistoryModelCopyWith<$Res> {
  _$PaymentHistoryModelCopyWithImpl(this._self, this._then);

  final PaymentHistoryModel _self;
  final $Res Function(PaymentHistoryModel) _then;

/// Create a copy of PaymentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiptNumber = null,Object? transactionDate = null,Object? id = null,Object? contractorId = null,Object? transactionId = null,Object? amount = null,Object? parkId = null,Object? status = null,Object? bankLogoUrl = freezed,}) {
  return _then(_self.copyWith(
receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contractorId: null == contractorId ? _self.contractorId : contractorId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,parkId: null == parkId ? _self.parkId : parkId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,bankLogoUrl: freezed == bankLogoUrl ? _self.bankLogoUrl : bankLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentHistoryModel].
extension PaymentHistoryModelPatterns on PaymentHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentHistoryModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentHistoryModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentHistoryModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'receipt_number')  String receiptNumber, @JsonKey(name: 'transaction_date')  int transactionDate,  String id, @JsonKey(name: 'contractor_id')  String contractorId, @JsonKey(name: 'transaction_id')  String transactionId,  int amount, @JsonKey(name: 'park_id')  int parkId,  String status, @JsonKey(name: 'bank_logo_url')  String? bankLogoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentHistoryModel() when $default != null:
return $default(_that.receiptNumber,_that.transactionDate,_that.id,_that.contractorId,_that.transactionId,_that.amount,_that.parkId,_that.status,_that.bankLogoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'receipt_number')  String receiptNumber, @JsonKey(name: 'transaction_date')  int transactionDate,  String id, @JsonKey(name: 'contractor_id')  String contractorId, @JsonKey(name: 'transaction_id')  String transactionId,  int amount, @JsonKey(name: 'park_id')  int parkId,  String status, @JsonKey(name: 'bank_logo_url')  String? bankLogoUrl)  $default,) {final _that = this;
switch (_that) {
case _PaymentHistoryModel():
return $default(_that.receiptNumber,_that.transactionDate,_that.id,_that.contractorId,_that.transactionId,_that.amount,_that.parkId,_that.status,_that.bankLogoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'receipt_number')  String receiptNumber, @JsonKey(name: 'transaction_date')  int transactionDate,  String id, @JsonKey(name: 'contractor_id')  String contractorId, @JsonKey(name: 'transaction_id')  String transactionId,  int amount, @JsonKey(name: 'park_id')  int parkId,  String status, @JsonKey(name: 'bank_logo_url')  String? bankLogoUrl)?  $default,) {final _that = this;
switch (_that) {
case _PaymentHistoryModel() when $default != null:
return $default(_that.receiptNumber,_that.transactionDate,_that.id,_that.contractorId,_that.transactionId,_that.amount,_that.parkId,_that.status,_that.bankLogoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentHistoryModel implements PaymentHistoryModel {
  const _PaymentHistoryModel({@JsonKey(name: 'receipt_number') required this.receiptNumber, @JsonKey(name: 'transaction_date') required this.transactionDate, required this.id, @JsonKey(name: 'contractor_id') required this.contractorId, @JsonKey(name: 'transaction_id') required this.transactionId, required this.amount, @JsonKey(name: 'park_id') required this.parkId, required this.status, @JsonKey(name: 'bank_logo_url') this.bankLogoUrl});
  factory _PaymentHistoryModel.fromJson(Map<String, dynamic> json) => _$PaymentHistoryModelFromJson(json);

@override@JsonKey(name: 'receipt_number') final  String receiptNumber;
@override@JsonKey(name: 'transaction_date') final  int transactionDate;
@override final  String id;
@override@JsonKey(name: 'contractor_id') final  String contractorId;
@override@JsonKey(name: 'transaction_id') final  String transactionId;
@override final  int amount;
@override@JsonKey(name: 'park_id') final  int parkId;
@override final  String status;
@override@JsonKey(name: 'bank_logo_url') final  String? bankLogoUrl;

/// Create a copy of PaymentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentHistoryModelCopyWith<_PaymentHistoryModel> get copyWith => __$PaymentHistoryModelCopyWithImpl<_PaymentHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentHistoryModel&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.id, id) || other.id == id)&&(identical(other.contractorId, contractorId) || other.contractorId == contractorId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.parkId, parkId) || other.parkId == parkId)&&(identical(other.status, status) || other.status == status)&&(identical(other.bankLogoUrl, bankLogoUrl) || other.bankLogoUrl == bankLogoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptNumber,transactionDate,id,contractorId,transactionId,amount,parkId,status,bankLogoUrl);

@override
String toString() {
  return 'PaymentHistoryModel(receiptNumber: $receiptNumber, transactionDate: $transactionDate, id: $id, contractorId: $contractorId, transactionId: $transactionId, amount: $amount, parkId: $parkId, status: $status, bankLogoUrl: $bankLogoUrl)';
}


}

/// @nodoc
abstract mixin class _$PaymentHistoryModelCopyWith<$Res> implements $PaymentHistoryModelCopyWith<$Res> {
  factory _$PaymentHistoryModelCopyWith(_PaymentHistoryModel value, $Res Function(_PaymentHistoryModel) _then) = __$PaymentHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'receipt_number') String receiptNumber,@JsonKey(name: 'transaction_date') int transactionDate, String id,@JsonKey(name: 'contractor_id') String contractorId,@JsonKey(name: 'transaction_id') String transactionId, int amount,@JsonKey(name: 'park_id') int parkId, String status,@JsonKey(name: 'bank_logo_url') String? bankLogoUrl
});




}
/// @nodoc
class __$PaymentHistoryModelCopyWithImpl<$Res>
    implements _$PaymentHistoryModelCopyWith<$Res> {
  __$PaymentHistoryModelCopyWithImpl(this._self, this._then);

  final _PaymentHistoryModel _self;
  final $Res Function(_PaymentHistoryModel) _then;

/// Create a copy of PaymentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiptNumber = null,Object? transactionDate = null,Object? id = null,Object? contractorId = null,Object? transactionId = null,Object? amount = null,Object? parkId = null,Object? status = null,Object? bankLogoUrl = freezed,}) {
  return _then(_PaymentHistoryModel(
receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contractorId: null == contractorId ? _self.contractorId : contractorId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,parkId: null == parkId ? _self.parkId : parkId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,bankLogoUrl: freezed == bankLogoUrl ? _self.bankLogoUrl : bankLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
