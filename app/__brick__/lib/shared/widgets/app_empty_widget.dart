import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:{{packageName}}/shared/core/translation/generated/l10n.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(
            width: size.width * 0.5,
            height: size.width * 0.5,
            child: RepaintBoundary(
              child: Lottie.asset(
                'assets/images/lotties/empty.json',
                fit: BoxFit.contain,
                frameRate: FrameRate.max, // 🔥 Оптимизация FPS
              ),
            ),
          ),
          Text(
            S.of(context).emptyDataAfterSearch,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
