import 'package:partner_up/features/payment_history/data/models/payment_history/payment_history_model.dart';
import 'package:partner_up/core/api_client/easy_api_client.dart';
import 'package:dartz/dartz.dart';

class PaymentHistoryRemoteDataSource {
  PaymentHistoryRemoteDataSource(this._apiClient);

  final EasyApiClient _apiClient;

  Future<Either<String, List<PaymentHistoryModel>>> getPaymentHistory(
    String contractorId,
  ) async {
    final result = await _apiClient.get<List<PaymentHistoryModel>>(
      'payments/$contractorId',
      fromJson: (data) {
        final list = data as List<dynamic>? ?? [];
        return list
            .map(
              (e) => PaymentHistoryModel.fromJson(
                Map<String, dynamic>.from(e as Map),
              ),
            )
            .toList();
      },
    );
    return result.fold(
      onSuccess: (s) => right(s.data),
      onFailure: (f) => left(f.message),
    );
  }
}
