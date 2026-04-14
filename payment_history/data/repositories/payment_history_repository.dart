import 'package:partner_up/features/payment_history/data/models/payment_history/payment_history_model.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentHistoryRepository {
  Future<Either<String, List<PaymentHistoryModel>>> getPaymentHistory(
    String contractorId,
  );
}
