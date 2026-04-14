import 'package:auto_route/auto_route.dart';
import 'package:partner_up/core/utils/show/show_toast.dart';
import 'package:partner_up/features/payment_history/presentation/cubits/payment_history/payment_history_cubit.dart';
import 'package:partner_up/core/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_up/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:partner_up/features/profile/presentation/cubits/profile/profile_state.dart';

@RoutePage()
class PaymentHistoryNavigator extends StatelessWidget
    implements AutoRouteWrapper {
  const PaymentHistoryNavigator({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final contractorId = context.read<ProfileCubit>().state.whenOrNull(
      loaded: (profile) => profile.contractorId,
    );
    if (contractorId == null) {
      showToast(msg: 'Пользователь не найден', isError: true);
      return const SizedBox.shrink();
    }
    return BlocProvider(
      create: (_) {
        final cubit = sl<PaymentHistoryCubit>();
        return cubit..loadPaymentHistory(contractorId);
      },
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
