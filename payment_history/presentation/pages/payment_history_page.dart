import 'package:auto_route/auto_route.dart';
import 'package:partner_up/features/payment_history/presentation/cubits/payment_history/payment_history_cubit.dart';
import 'package:partner_up/features/payment_history/presentation/cubits/payment_history/payment_history_state.dart';
import 'package:partner_up/features/payment_history/presentation/widgets/payment_history_widget.dart';
import 'package:partner_up/shared/widgets/app_empty_widget.dart';
import 'package:partner_up/shared/widgets/app_error_widget.dart';
import 'package:partner_up/shared/widgets/app_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История выводов'),
        centerTitle: true,
        leading: const AutoLeadingButton(),
      ),
      body: BlocBuilder<PaymentHistoryCubit, PaymentHistoryState>(
        builder: (context, state) {
          return state.when(
            loading: () => const AppLoaderWidget(),
            error: (error) => AppErrorWidget(error: error),
            loaded: (data) {
              if (data.isEmpty) return AppEmptyWidget();
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return PaymentHistoryWidget(paymentHistory: item);
                },
              );
            },
          );
        },
      ),
    );
  }
}
