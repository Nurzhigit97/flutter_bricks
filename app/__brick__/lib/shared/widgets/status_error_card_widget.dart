import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/translation/generated/l10n.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';

class StatusErrorCardWidget extends StatelessWidget {
  final int statusCode;
  final String title;
  final String description;
  final String icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const StatusErrorCardWidget({
    super.key,
    required this.statusCode,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    this.onTap,
  });

  factory StatusErrorCardWidget.fromStatusCode(
    int statusCode,
    BuildContext context,
  ) {
    switch (statusCode) {
      case 0: // Сетевая ошибка
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: S.of(context).hasntInternet,
          description: S.of(context).checkInternetConnection,
          icon: '📡',
          color: AppColors.warningLight,
          backgroundColor: AppColors.warningBGLight,
        );
      case 400:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '400 - Bad Request',
          description: S.of(context).badRequest,
          icon: '⚠️',
          color: AppColors.warningLight,
          backgroundColor: AppColors.warningBGLight,
        );
      case 401:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '401 - Unauthorized',
          description: S.of(context).unauthorized,
          icon: '🔐',
          color: AppColors.errorLight,
          backgroundColor: AppColors.errorBGLight,
        );
      case 403:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '403 - Forbidden',
          description: S.of(context).forbidden,
          icon: '🚫',
          color: AppColors.errorLight,
          backgroundColor: AppColors.errorBGLight,
        );
      case 404:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '404 - Not Found',
          description: S.of(context).notFound,
          icon: '🔍',
          color: AppColors.grey,
          backgroundColor: AppColors.mainLight,
        );
      case 500:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '500 - Server Error',
          description: S.of(context).serverError,
          icon: '⚡',
          color: AppColors.errorLight,
          backgroundColor: AppColors.errorBGLight,
        );
      case 502:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '502 - Bad Gateway',
          description: S.of(context).badGateway,
          icon: '🌐',
          color: AppColors.warningLight,
          backgroundColor: AppColors.warningBGLight,
        );
      case 503:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '503 - Service Unavailable',
          description: S.of(context).serviceUnavailable,
          icon: '🛠️',
          color: AppColors.warningLight,
          backgroundColor: AppColors.warningBGLight,
        );
      default:
        return StatusErrorCardWidget(
          statusCode: statusCode,
          title: '${S.of(context).error} $statusCode',
          description: S.of(context).other_error,
          icon: '❌',
          color: AppColors.errorLight,
          backgroundColor: AppColors.errorBGLight,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Container(
              //       width: 32,
              //       height: 32,
              //       decoration: BoxDecoration(
              //         color: color,
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       child: Center(
              //         child: Text(icon, style: const TextStyle(fontSize: 16)),
              //       ),
              //     ),
              //     const SizedBox(width: 8),
              //     Expanded(
              //       child: Text(
              //         statusCode == 0 ? 'NET' : '$statusCode',
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.w700,
              //           color: color,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 12),
              // Text(
              //   title,
              //   style: const TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w600,
              //     color: AppColors.textMainLight,
              //   ),
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              // ),
              const SizedBox(height: 4),
              Expanded(
                child: Center(
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
