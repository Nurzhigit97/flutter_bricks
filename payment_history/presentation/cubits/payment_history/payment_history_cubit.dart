import 'package:partner_up/features/payment_history/data/repositories/payment_history_repository.dart';
import 'package:partner_up/features/payment_history/presentation/cubits/payment_history/payment_history_state.dart';
import 'package:partner_up/core/utils/extensions/on_future_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  final PaymentHistoryRepository _repository;
  PaymentHistoryCubit(this._repository)
    : super(const PaymentHistoryState.loading());

  Future<void> loadPaymentHistory(String contractorId) async {
    emit(const PaymentHistoryState.loading());
    await _repository
        .getPaymentHistory(contractorId)
        .foldVoid(
          (err) => emit(PaymentHistoryState.error(error: err)),
          (items) => emit(PaymentHistoryState.loaded(items)),
        );
  }
}
