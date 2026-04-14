import 'package:partner_up/features/payment_history/data/datasource/payment_history_remote_data_source.dart';
import 'package:partner_up/features/payment_history/data/repositories/payment_history_impl_repository.dart';
import 'package:partner_up/features/payment_history/data/repositories/payment_history_repository.dart';
import 'package:partner_up/features/payment_history/presentation/cubits/payment_history/payment_history_cubit.dart';
import 'package:partner_up/core/api_client/easy_api_client.dart';
import 'package:partner_up/core/utils/injections.dart';

Future<void> paymentHistoryInjection() async {
  sl.registerLazySingleton<PaymentHistoryRepository>(
    () => PaymentHistoryImplRepository(
      PaymentHistoryRemoteDataSource(sl<EasyApiClient>()),
    ),
  );
  sl.registerFactory(() => PaymentHistoryCubit(sl<PaymentHistoryRepository>()));
}
