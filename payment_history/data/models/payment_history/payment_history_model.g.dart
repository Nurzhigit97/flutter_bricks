// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentHistoryModel _$PaymentHistoryModelFromJson(Map<String, dynamic> json) =>
    _PaymentHistoryModel(
      receiptNumber: json['receipt_number'] as String,
      transactionDate: (json['transaction_date'] as num).toInt(),
      id: json['id'] as String,
      contractorId: json['contractor_id'] as String,
      transactionId: json['transaction_id'] as String,
      amount: (json['amount'] as num).toInt(),
      parkId: (json['park_id'] as num).toInt(),
      status: json['status'] as String,
      bankLogoUrl: json['bank_logo_url'] as String?,
    );

Map<String, dynamic> _$PaymentHistoryModelToJson(
  _PaymentHistoryModel instance,
) => <String, dynamic>{
  'receipt_number': instance.receiptNumber,
  'transaction_date': instance.transactionDate,
  'id': instance.id,
  'contractor_id': instance.contractorId,
  'transaction_id': instance.transactionId,
  'amount': instance.amount,
  'park_id': instance.parkId,
  'status': instance.status,
  'bank_logo_url': instance.bankLogoUrl,
};
