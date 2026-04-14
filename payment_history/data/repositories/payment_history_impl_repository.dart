import 'package:partner_up/features/payment_history/data/datasource/payment_history_remote_data_source.dart';
import 'package:partner_up/features/payment_history/data/models/payment_history/payment_history_model.dart';
import 'package:partner_up/features/payment_history/data/repositories/payment_history_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentHistoryImplRepository implements PaymentHistoryRepository {
  PaymentHistoryImplRepository(this._remoteDataSource);

  final PaymentHistoryRemoteDataSource _remoteDataSource;

  @override
  Future<Either<String, List<PaymentHistoryModel>>> getPaymentHistory(
    String contractorId,
  ) async {
    final result = await _remoteDataSource.getPaymentHistory(contractorId);
    return result.fold((err) => left(err), (list) => right(list));
  }
}
