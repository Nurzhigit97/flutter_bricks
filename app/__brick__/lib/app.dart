import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/app_features/app_features_cubit.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/app_tab/app_tab_cubit.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/connectivity/connectivity_cubit.dart';
import 'package:{{packageName}}/shared/app_features/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:{{packageName}}/shared/core/services/deep_link_service.dart';
import 'package:{{packageName}}/shared/routes/app_routes.dart';
import 'package:{{packageName}}/shared/theme/dark_theme.dart';
import 'package:{{packageName}}/shared/theme/light_theme.dart';
import 'package:{{packageName}}/shared/utils/injections.dart';
import 'package:{{packageName}}/shared/utils/log/app_route_observer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:{{packageName}}/shared/core/translation/generated/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter = sl<AppRouter>();
  bool _didInitDeepLinks = false;

  @override
  void initState() {
    super.initState();
    // Initialize deep links after first frame to ensure router is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_didInitDeepLinks) {
        DeepLinkService().initialize(_appRouter);
        _didInitDeepLinks = true;
      }
    });
  }

  @override
  void dispose() {
    DeepLinkService().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Global Bloc Providers
        BlocProvider(create: (context) => sl<AppFeaturesCubit>()),
        BlocProvider(create: (context) => sl<ConnectivityCubit>()),
        BlocProvider(create: (context) => sl<CustomTabCubit>()),
        BlocProvider(create: (context) => sl<LanguageCubit>()),
        // Feature Bloc Providers
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp.router(
                title: 'BaseApp',
                routerConfig: _appRouter.config(
                  navigatorObservers: () => [AnalyticsRouteObserver()],
                ),
                builder: (context, child) => EasyLoading.init()(context, child),
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,
              );
            },
            child: const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
