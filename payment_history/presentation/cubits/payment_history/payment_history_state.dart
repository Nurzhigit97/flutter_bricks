import 'package:partner_up/features/payment_history/data/models/payment_history/payment_history_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history_state.freezed.dart';

@freezed
sealed class PaymentHistoryState with _$PaymentHistoryState {

  const factory PaymentHistoryState.loading() = _PaymentHistoryLoading;
  const factory PaymentHistoryState.loaded(List<PaymentHistoryModel> data) = _PaymentHistoryLoaded;
  const factory PaymentHistoryState.error({required String error}) = _PaymentHistoryError;
}
