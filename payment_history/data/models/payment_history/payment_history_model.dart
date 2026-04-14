import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history_model.freezed.dart';
part 'payment_history_model.g.dart';

@freezed
abstract class PaymentHistoryModel with _$PaymentHistoryModel {
  const factory PaymentHistoryModel({
    @JsonKey(name: 'receipt_number') required String receiptNumber,
    @JsonKey(name: 'transaction_date') required int transactionDate,
    required String id,
    @JsonKey(name: 'contractor_id') required String contractorId,
    @JsonKey(name: 'transaction_id') required String transactionId,
    required int amount,
    @JsonKey(name: 'park_id') required int parkId,
    required String status,
    @JsonKey(name: 'bank_logo_url') String? bankLogoUrl,
  }) = _PaymentHistoryModel;

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryModelFromJson(json);
}
