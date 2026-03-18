import 'package:{{packageName}}/shared/utils/constants/app_const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/core/services/storage/local_storage.dart';
import 'package:auto_route/auto_route.dart';
import 'package:{{packageName}}/shared/widgets/app_loader_widget.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<bool> _isFirstLaunch() async {
    final isFirstLaunch = sl<LocalStorage>().getBool(AppConst.isFirstLaunch);
    return isFirstLaunch;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isFirstLaunch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoaderWidget();
        } else {
          Future.delayed(const Duration(seconds: 1), () async {
            if (!mounted) return;
            if (snapshot.hasData && snapshot.data!) {
              if (context.mounted) {
                // TODO: Implement navigate to the screen
              }
            } else {
              // Check authentication status
              // final isAuthenticated = await _isAuthenticated();
              // if (!mounted) return;
              // if (isAuthenticated) {
              //   // Navigate to home if authenticated
              //   // ignore: use_build_context_synchronously
              //   context.router.replace(const MainNavigator());
              // } else {
              //   // Navigate to login if not authenticated
              //   // ignore: use_build_context_synchronously
              //   context.router.replace(const SignInRoute());
              // }
              if (context.mounted) {
                // TODO: Implement navigate to the screen
              }
            }
          });

          return const Center(child: Icon(Icons.school, size: 180));
        }
      },
    );
  }
}
