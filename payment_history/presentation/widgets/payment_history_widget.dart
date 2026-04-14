import 'package:partner_up/core/theme/styles/app_colors.dart';
import 'package:partner_up/core/utils/extensions/date_time_extensions.dart';
import 'package:partner_up/features/payment_history/data/models/payment_history/payment_history_model.dart';
import 'package:partner_up/shared/widgets/select_image/app_network_image_widget.dart';
import 'package:flutter/material.dart';

class PaymentHistoryWidget extends StatelessWidget {
  final PaymentHistoryModel paymentHistory;

  const PaymentHistoryWidget({super.key, required this.paymentHistory});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateTime.fromMillisecondsSinceEpoch(
      paymentHistory.transactionDate,
    ).toLocal().formatDate(dateFormat: 'dd.MM.yyyy · HH:mm');

    final statusStyle = _statusVisuals(paymentHistory.status);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgButton),
        boxShadow: [
          BoxShadow(
            color: AppColors.textSecondaryLight.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BankAvatar(logoUrl: paymentHistory.bankLogoUrl),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${paymentHistory.amount} с',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textMainLight,
                          height: 1.15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _StatusChip(
                      label: statusStyle.label,
                      fg: statusStyle.foreground,
                      bg: statusStyle.background,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 16,
                      color: AppColors.textSecondaryLight,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        dateStr,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
                if (paymentHistory.receiptNumber.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Чек · ${_shortId(paymentHistory.receiptNumber)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.hintColor,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _shortId(String value) {
    if (value.length <= 13) return value;
    return '${value.substring(0, 8)}…${value.substring(value.length - 4)}';
  }
}

class _BankAvatar extends StatelessWidget {
  final String? logoUrl;

  const _BankAvatar({this.logoUrl});

  @override
  Widget build(BuildContext context) {
    final hasLogo = logoUrl != null && logoUrl!.trim().isNotEmpty;

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.bgButton,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey1),
      ),
      clipBehavior: Clip.antiAlias,
      child: hasLogo
          ? AppNetworkImageWidget(
              imageUrl: logoUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(11),
            )
          : const Icon(
              Icons.account_balance_rounded,
              color: AppColors.primaryAccent,
              size: 26,
            ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color fg;
  final Color bg;

  const _StatusChip({required this.label, required this.fg, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }
}

({String label, Color foreground, Color background}) _statusVisuals(
  String status,
) {
  switch (status.toLowerCase()) {
    case 'success':
      return (
        label: 'Успешно',
        foreground: AppColors.successLight,
        background: AppColors.successBGLight,
      );
    case 'failed':
    case 'error':
    case 'rejected':
      return (
        label: 'Отклонено',
        foreground: AppColors.errorLight,
        background: AppColors.errorBGLight,
      );
    case 'pending':
    case 'processing':
      return (
        label: 'В обработке',
        foreground: AppColors.focusLight,
        background: AppColors.focusBGLight,
      );
    default:
      return (
        label: status,
        foreground: AppColors.textSecondaryLight,
        background: AppColors.hintBackColor,
      );
  }
}
