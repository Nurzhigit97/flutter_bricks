import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:work_up/core/translation/generated/l10n.dart';

class NoInternetBottomSheet extends StatelessWidget {
  const NoInternetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        // Если результат true, то закрываем приложение
        if (context.mounted && result == true) {
          Navigator.of(context).pop(true);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).hasntInternet,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    S.of(context).checkInternetConnection,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.width * 0.5,
                    child: RepaintBoundary(
                      child: Lottie.asset(
                        'assets/images/lotties/no_connection.json',
                        frameRate: FrameRate.max,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
