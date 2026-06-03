// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:collection/collection.dart' as _i36;
import 'package:flutter/material.dart' as _i35;
import 'package:{{packageName}}/features/auth/auth_navigator.dart' as _i6;
import 'package:{{packageName}}/features/auth/data/models/auth/contractor_park_item.dart'
    as _i37;
import 'package:{{packageName}}/features/auth/presentation/pages/auth_fleet_select_page.dart'
    as _i4;
import 'package:{{packageName}}/features/auth/presentation/pages/auth_login_password_page.dart'
    as _i5;
import 'package:{{packageName}}/features/auth/presentation/pages/auth_partner_welcome_page.dart'
    as _i7;
import 'package:{{packageName}}/features/auth/presentation/pages/login_page.dart'
    as _i9;
import 'package:{{packageName}}/features/auth/presentation/pages/register_page.dart'
    as _i8;
import 'package:{{packageName}}/features/finik_pay/finik_pay_navigator.dart' as _i13;
import 'package:{{packageName}}/features/finik_pay/presentation/pages/finik_pay_page.dart'
    as _i14;
import 'package:{{packageName}}/features/home/home_navigator.dart' as _i15;
import 'package:{{packageName}}/features/home/presentation/pages/home_page.dart'
    as _i16;
import 'package:{{packageName}}/features/main_page.dart' as _i17;
import 'package:{{packageName}}/features/news/data/models/news/news_model.dart'
    as _i39;
import 'package:{{packageName}}/features/news/news_navigator.dart' as _i19;
import 'package:{{packageName}}/features/news/presentation/pages/news_detail_page.dart'
    as _i18;
import 'package:{{packageName}}/features/news/presentation/pages/news_page.dart'
    as _i20;
import 'package:{{packageName}}/features/notification/notification_navigator.dart'
    as _i21;
import 'package:{{packageName}}/features/notification/presentation/pages/notification_page.dart'
    as _i22;
import 'package:{{packageName}}/features/payment_history/data/models/payment_history/payment_history_model.dart'
    as _i40;
import 'package:{{packageName}}/features/payment_history/payment_history_navigator.dart'
    as _i24;
import 'package:{{packageName}}/features/payment_history/presentation/pages/payment_history_detail_page.dart'
    as _i23;
import 'package:{{packageName}}/features/payment_history/presentation/pages/payment_history_page.dart'
    as _i25;
import 'package:{{packageName}}/features/profile/presentation/pages/profile_detail_page.dart'
    as _i27;
import 'package:{{packageName}}/features/profile/presentation/pages/profile_page.dart'
    as _i29;
import 'package:{{packageName}}/features/profile/profile_navigator.dart' as _i28;
import 'package:{{packageName}}/features/withdrawal/data/models/banks/banks_model.dart'
    as _i38;
import 'package:{{packageName}}/features/withdrawal/presentation/pages/banks_page.dart'
    as _i10;
import 'package:{{packageName}}/features/withdrawal/presentation/pages/check_number_page.dart'
    as _i11;
import 'package:{{packageName}}/features/withdrawal/presentation/pages/payment_success_page.dart'
    as _i26;
import 'package:{{packageName}}/features/withdrawal/presentation/pages/submit_payment_number_page.dart'
    as _i31;
import 'package:{{packageName}}/features/withdrawal/withdrawal_navigator.dart'
    as _i33;
import 'package:{{packageName}}/shared/app_features/presentation/pages/app_pdf_view_page.dart'
    as _i1;
import 'package:{{packageName}}/shared/app_features/presentation/pages/splash_page.dart'
    as _i30;
import 'package:{{packageName}}/shared/app_features/presentation/pages/tab_view_page.dart'
    as _i12;
import 'package:{{packageName}}/shared/app_features/presentation/pages/web_view_page.dart'
    as _i32;
import 'package:{{packageName}}/shared/widgets/select_image/app_full_screen_image_page.dart'
    as _i2;
import 'package:{{packageName}}/shared/widgets/select_image/app_full_screen_images_page.dart'
    as _i3;

/// generated route for
/// [_i1.AppPdfViewPage]
class AppPdfViewRoute extends _i34.PageRouteInfo<AppPdfViewRouteArgs> {
  AppPdfViewRoute({
    _i35.Key? key,
    required String pdfUrl,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AppPdfViewRoute.name,
         args: AppPdfViewRouteArgs(key: key, pdfUrl: pdfUrl),
         initialChildren: children,
       );

  static const String name = 'AppPdfViewRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppPdfViewRouteArgs>();
      return _i1.AppPdfViewPage(key: args.key, pdfUrl: args.pdfUrl);
    },
  );
}

class AppPdfViewRouteArgs {
  const AppPdfViewRouteArgs({this.key, required this.pdfUrl});

  final _i35.Key? key;

  final String pdfUrl;

  @override
  String toString() {
    return 'AppPdfViewRouteArgs{key: $key, pdfUrl: $pdfUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AppPdfViewRouteArgs) return false;
    return key == other.key && pdfUrl == other.pdfUrl;
  }

  @override
  int get hashCode => key.hashCode ^ pdfUrl.hashCode;
}

/// generated route for
/// [_i2.AppSeeFullImagePage]
class AppSeeFullImageRoute
    extends _i34.PageRouteInfo<AppSeeFullImageRouteArgs> {
  AppSeeFullImageRoute({
    _i35.Key? key,
    required String imageUrl,
    int? index,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AppSeeFullImageRoute.name,
         args: AppSeeFullImageRouteArgs(
           key: key,
           imageUrl: imageUrl,
           index: index,
         ),
         initialChildren: children,
       );

  static const String name = 'AppSeeFullImageRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppSeeFullImageRouteArgs>();
      return _i2.AppSeeFullImagePage(
        key: args.key,
        imageUrl: args.imageUrl,
        index: args.index,
      );
    },
  );
}

class AppSeeFullImageRouteArgs {
  const AppSeeFullImageRouteArgs({
    this.key,
    required this.imageUrl,
    this.index,
  });

  final _i35.Key? key;

  final String imageUrl;

  final int? index;

  @override
  String toString() {
    return 'AppSeeFullImageRouteArgs{key: $key, imageUrl: $imageUrl, index: $index}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AppSeeFullImageRouteArgs) return false;
    return key == other.key &&
        imageUrl == other.imageUrl &&
        index == other.index;
  }

  @override
  int get hashCode => key.hashCode ^ imageUrl.hashCode ^ index.hashCode;
}

/// generated route for
/// [_i3.AppSeeFullImagesPage]
class AppSeeFullImagesRoute
    extends _i34.PageRouteInfo<AppSeeFullImagesRouteArgs> {
  AppSeeFullImagesRoute({
    _i35.Key? key,
    required List<String> imageUrls,
    required int initialIndex,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AppSeeFullImagesRoute.name,
         args: AppSeeFullImagesRouteArgs(
           key: key,
           imageUrls: imageUrls,
           initialIndex: initialIndex,
         ),
         initialChildren: children,
       );

  static const String name = 'AppSeeFullImagesRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppSeeFullImagesRouteArgs>();
      return _i3.AppSeeFullImagesPage(
        key: args.key,
        imageUrls: args.imageUrls,
        initialIndex: args.initialIndex,
      );
    },
  );
}

class AppSeeFullImagesRouteArgs {
  const AppSeeFullImagesRouteArgs({
    this.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  final _i35.Key? key;

  final List<String> imageUrls;

  final int initialIndex;

  @override
  String toString() {
    return 'AppSeeFullImagesRouteArgs{key: $key, imageUrls: $imageUrls, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AppSeeFullImagesRouteArgs) return false;
    return key == other.key &&
        const _i36.ListEquality<String>().equals(imageUrls, other.imageUrls) &&
        initialIndex == other.initialIndex;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i36.ListEquality<String>().hash(imageUrls) ^
      initialIndex.hashCode;
}

/// generated route for
/// [_i4.AuthFleetSelectPage]
class AuthFleetSelectRoute
    extends _i34.PageRouteInfo<AuthFleetSelectRouteArgs> {
  AuthFleetSelectRoute({
    _i35.Key? key,
    required String phoneNumber,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AuthFleetSelectRoute.name,
         args: AuthFleetSelectRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'AuthFleetSelectRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthFleetSelectRouteArgs>();
      return _i4.AuthFleetSelectPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class AuthFleetSelectRouteArgs {
  const AuthFleetSelectRouteArgs({this.key, required this.phoneNumber});

  final _i35.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'AuthFleetSelectRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthFleetSelectRouteArgs) return false;
    return key == other.key && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => key.hashCode ^ phoneNumber.hashCode;
}

/// generated route for
/// [_i5.AuthLoginPasswordPage]
class AuthLoginPasswordRoute
    extends _i34.PageRouteInfo<AuthLoginPasswordRouteArgs> {
  AuthLoginPasswordRoute({
    _i35.Key? key,
    required String phoneNumber,
    required _i37.ContractorParkItem contractor,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AuthLoginPasswordRoute.name,
         args: AuthLoginPasswordRouteArgs(
           key: key,
           phoneNumber: phoneNumber,
           contractor: contractor,
         ),
         initialChildren: children,
       );

  static const String name = 'AuthLoginPasswordRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthLoginPasswordRouteArgs>();
      return _i5.AuthLoginPasswordPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
        contractor: args.contractor,
      );
    },
  );
}

class AuthLoginPasswordRouteArgs {
  const AuthLoginPasswordRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.contractor,
  });

  final _i35.Key? key;

  final String phoneNumber;

  final _i37.ContractorParkItem contractor;

  @override
  String toString() {
    return 'AuthLoginPasswordRouteArgs{key: $key, phoneNumber: $phoneNumber, contractor: $contractor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthLoginPasswordRouteArgs) return false;
    return key == other.key &&
        phoneNumber == other.phoneNumber &&
        contractor == other.contractor;
  }

  @override
  int get hashCode => key.hashCode ^ phoneNumber.hashCode ^ contractor.hashCode;
}

/// generated route for
/// [_i6.AuthNavigator]
class AuthNavigator extends _i34.PageRouteInfo<void> {
  const AuthNavigator({List<_i34.PageRouteInfo>? children})
    : super(AuthNavigator.name, initialChildren: children);

  static const String name = 'AuthNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i6.AuthNavigator();
    },
  );
}

/// generated route for
/// [_i7.AuthPartnerWelcomePage]
class AuthPartnerWelcomeRoute extends _i34.PageRouteInfo<void> {
  const AuthPartnerWelcomeRoute({List<_i34.PageRouteInfo>? children})
    : super(AuthPartnerWelcomeRoute.name, initialChildren: children);

  static const String name = 'AuthPartnerWelcomeRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i7.AuthPartnerWelcomePage();
    },
  );
}

/// generated route for
/// [_i8.AuthPasswordPage]
class AuthPasswordRoute extends _i34.PageRouteInfo<AuthPasswordRouteArgs> {
  AuthPasswordRoute({
    _i35.Key? key,
    required String phoneNumber,
    required _i37.ContractorParkItem contractor,
    bool isPasswordReset = false,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AuthPasswordRoute.name,
         args: AuthPasswordRouteArgs(
           key: key,
           phoneNumber: phoneNumber,
           contractor: contractor,
           isPasswordReset: isPasswordReset,
         ),
         initialChildren: children,
       );

  static const String name = 'AuthPasswordRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthPasswordRouteArgs>();
      return _i8.AuthPasswordPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
        contractor: args.contractor,
        isPasswordReset: args.isPasswordReset,
      );
    },
  );
}

class AuthPasswordRouteArgs {
  const AuthPasswordRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.contractor,
    this.isPasswordReset = false,
  });

  final _i35.Key? key;

  final String phoneNumber;

  final _i37.ContractorParkItem contractor;

  final bool isPasswordReset;

  @override
  String toString() {
    return 'AuthPasswordRouteArgs{key: $key, phoneNumber: $phoneNumber, contractor: $contractor, isPasswordReset: $isPasswordReset}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthPasswordRouteArgs) return false;
    return key == other.key &&
        phoneNumber == other.phoneNumber &&
        contractor == other.contractor &&
        isPasswordReset == other.isPasswordReset;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      phoneNumber.hashCode ^
      contractor.hashCode ^
      isPasswordReset.hashCode;
}

/// generated route for
/// [_i9.AuthPhonePage]
class AuthPhoneRoute extends _i34.PageRouteInfo<void> {
  const AuthPhoneRoute({List<_i34.PageRouteInfo>? children})
    : super(AuthPhoneRoute.name, initialChildren: children);

  static const String name = 'AuthPhoneRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i9.AuthPhonePage();
    },
  );
}

/// generated route for
/// [_i10.BanksPage]
class BanksRoute extends _i34.PageRouteInfo<void> {
  const BanksRoute({List<_i34.PageRouteInfo>? children})
    : super(BanksRoute.name, initialChildren: children);

  static const String name = 'BanksRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i10.BanksPage();
    },
  );
}

/// generated route for
/// [_i11.CheckNumberPage]
class CheckNumberRoute extends _i34.PageRouteInfo<CheckNumberRouteArgs> {
  CheckNumberRoute({
    _i35.Key? key,
    required _i38.BanksModel bank,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         CheckNumberRoute.name,
         args: CheckNumberRouteArgs(key: key, bank: bank),
         initialChildren: children,
       );

  static const String name = 'CheckNumberRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckNumberRouteArgs>();
      return _i34.WrappedRoute(
        child: _i11.CheckNumberPage(key: args.key, bank: args.bank),
      );
    },
  );
}

class CheckNumberRouteArgs {
  const CheckNumberRouteArgs({this.key, required this.bank});

  final _i35.Key? key;

  final _i38.BanksModel bank;

  @override
  String toString() {
    return 'CheckNumberRouteArgs{key: $key, bank: $bank}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CheckNumberRouteArgs) return false;
    return key == other.key && bank == other.bank;
  }

  @override
  int get hashCode => key.hashCode ^ bank.hashCode;
}

/// generated route for
/// [_i12.CustomTabbarPage]
class CustomTabbarRoute extends _i34.PageRouteInfo<CustomTabbarRouteArgs> {
  CustomTabbarRoute({
    _i35.Key? key,
    required List<String> tabs,
    required List<_i35.Widget> tabViews,
    bool? isChildView,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         CustomTabbarRoute.name,
         args: CustomTabbarRouteArgs(
           key: key,
           tabs: tabs,
           tabViews: tabViews,
           isChildView: isChildView,
         ),
         initialChildren: children,
       );

  static const String name = 'CustomTabbarRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomTabbarRouteArgs>();
      return _i12.CustomTabbarPage(
        key: args.key,
        tabs: args.tabs,
        tabViews: args.tabViews,
        isChildView: args.isChildView,
      );
    },
  );
}

class CustomTabbarRouteArgs {
  const CustomTabbarRouteArgs({
    this.key,
    required this.tabs,
    required this.tabViews,
    this.isChildView,
  });

  final _i35.Key? key;

  final List<String> tabs;

  final List<_i35.Widget> tabViews;

  final bool? isChildView;

  @override
  String toString() {
    return 'CustomTabbarRouteArgs{key: $key, tabs: $tabs, tabViews: $tabViews, isChildView: $isChildView}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomTabbarRouteArgs) return false;
    return key == other.key &&
        const _i36.ListEquality<String>().equals(tabs, other.tabs) &&
        const _i36.ListEquality<_i35.Widget>().equals(
          tabViews,
          other.tabViews,
        ) &&
        isChildView == other.isChildView;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i36.ListEquality<String>().hash(tabs) ^
      const _i36.ListEquality<_i35.Widget>().hash(tabViews) ^
      isChildView.hashCode;
}

/// generated route for
/// [_i13.FinikPayNavigator]
class FinikPayNavigator extends _i34.PageRouteInfo<void> {
  const FinikPayNavigator({List<_i34.PageRouteInfo>? children})
    : super(FinikPayNavigator.name, initialChildren: children);

  static const String name = 'FinikPayNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return _i34.WrappedRoute(child: const _i13.FinikPayNavigator());
    },
  );
}

/// generated route for
/// [_i14.FinikPayPage]
class FinikPayRoute extends _i34.PageRouteInfo<void> {
  const FinikPayRoute({List<_i34.PageRouteInfo>? children})
    : super(FinikPayRoute.name, initialChildren: children);

  static const String name = 'FinikPayRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i14.FinikPayPage();
    },
  );
}

/// generated route for
/// [_i15.HomeNavigator]
class HomeNavigator extends _i34.PageRouteInfo<void> {
  const HomeNavigator({List<_i34.PageRouteInfo>? children})
    : super(HomeNavigator.name, initialChildren: children);

  static const String name = 'HomeNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return _i34.WrappedRoute(child: const _i15.HomeNavigator());
    },
  );
}

/// generated route for
/// [_i16.HomePage]
class HomeRoute extends _i34.PageRouteInfo<void> {
  const HomeRoute({List<_i34.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i16.HomePage();
    },
  );
}

/// generated route for
/// [_i17.MainPage]
class MainRoute extends _i34.PageRouteInfo<void> {
  const MainRoute({List<_i34.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i17.MainPage();
    },
  );
}

/// generated route for
/// [_i18.NewsDetailPage]
class NewsDetailRoute extends _i34.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i35.Key? key,
    required _i39.NewsModel item,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         NewsDetailRoute.name,
         args: NewsDetailRouteArgs(key: key, item: item),
         initialChildren: children,
       );

  static const String name = 'NewsDetailRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsDetailRouteArgs>();
      return _i18.NewsDetailPage(key: args.key, item: args.item);
    },
  );
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.item});

  final _i35.Key? key;

  final _i39.NewsModel item;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, item: $item}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsDetailRouteArgs) return false;
    return key == other.key && item == other.item;
  }

  @override
  int get hashCode => key.hashCode ^ item.hashCode;
}

/// generated route for
/// [_i19.NewsNavigator]
class NewsNavigator extends _i34.PageRouteInfo<void> {
  const NewsNavigator({List<_i34.PageRouteInfo>? children})
    : super(NewsNavigator.name, initialChildren: children);

  static const String name = 'NewsNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return _i34.WrappedRoute(child: const _i19.NewsNavigator());
    },
  );
}

/// generated route for
/// [_i20.NewsPage]
class NewsRoute extends _i34.PageRouteInfo<void> {
  const NewsRoute({List<_i34.PageRouteInfo>? children})
    : super(NewsRoute.name, initialChildren: children);

  static const String name = 'NewsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i20.NewsPage();
    },
  );
}

/// generated route for
/// [_i21.NotificationNavigator]
class NotificationNavigator extends _i34.PageRouteInfo<void> {
  const NotificationNavigator({List<_i34.PageRouteInfo>? children})
    : super(NotificationNavigator.name, initialChildren: children);

  static const String name = 'NotificationNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return _i34.WrappedRoute(child: const _i21.NotificationNavigator());
    },
  );
}

/// generated route for
/// [_i22.NotificationPage]
class NotificationRoute extends _i34.PageRouteInfo<void> {
  const NotificationRoute({List<_i34.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i22.NotificationPage();
    },
  );
}

/// generated route for
/// [_i23.PaymentHistoryDetailPage]
class PaymentHistoryDetailRoute
    extends _i34.PageRouteInfo<PaymentHistoryDetailRouteArgs> {
  PaymentHistoryDetailRoute({
    _i35.Key? key,
    required _i40.PaymentHistoryModel item,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         PaymentHistoryDetailRoute.name,
         args: PaymentHistoryDetailRouteArgs(key: key, item: item),
         initialChildren: children,
       );

  static const String name = 'PaymentHistoryDetailRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentHistoryDetailRouteArgs>();
      return _i23.PaymentHistoryDetailPage(key: args.key, item: args.item);
    },
  );
}

class PaymentHistoryDetailRouteArgs {
  const PaymentHistoryDetailRouteArgs({this.key, required this.item});

  final _i35.Key? key;

  final _i40.PaymentHistoryModel item;

  @override
  String toString() {
    return 'PaymentHistoryDetailRouteArgs{key: $key, item: $item}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentHistoryDetailRouteArgs) return false;
    return key == other.key && item == other.item;
  }

  @override
  int get hashCode => key.hashCode ^ item.hashCode;
}

/// generated route for
/// [_i24.PaymentHistoryNavigator]
class PaymentHistoryNavigator extends _i34.PageRouteInfo<void> {
  const PaymentHistoryNavigator({List<_i34.PageRouteInfo>? children})
    : super(PaymentHistoryNavigator.name, initialChildren: children);

  static const String name = 'PaymentHistoryNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return _i34.WrappedRoute(child: const _i24.PaymentHistoryNavigator());
    },
  );
}

/// generated route for
/// [_i25.PaymentHistoryPage]
class PaymentHistoryRoute extends _i34.PageRouteInfo<void> {
  const PaymentHistoryRoute({List<_i34.PageRouteInfo>? children})
    : super(PaymentHistoryRoute.name, initialChildren: children);

  static const String name = 'PaymentHistoryRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i25.PaymentHistoryPage();
    },
  );
}

/// generated route for
/// [_i26.PaymentSuccessPage]
class PaymentSuccessRoute extends _i34.PageRouteInfo<PaymentSuccessRouteArgs> {
  PaymentSuccessRoute({
    _i35.Key? key,
    required int amount,
    required String userName,
    required String phoneNumber,
    required DateTime dateTime,
    required String bankName,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         PaymentSuccessRoute.name,
         args: PaymentSuccessRouteArgs(
           key: key,
           amount: amount,
           userName: userName,
           phoneNumber: phoneNumber,
           dateTime: dateTime,
           bankName: bankName,
         ),
         initialChildren: children,
       );

  static const String name = 'PaymentSuccessRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentSuccessRouteArgs>();
      return _i26.PaymentSuccessPage(
        key: args.key,
        amount: args.amount,
        userName: args.userName,
        phoneNumber: args.phoneNumber,
        dateTime: args.dateTime,
        bankName: args.bankName,
      );
    },
  );
}

class PaymentSuccessRouteArgs {
  const PaymentSuccessRouteArgs({
    this.key,
    required this.amount,
    required this.userName,
    required this.phoneNumber,
    required this.dateTime,
    required this.bankName,
  });

  final _i35.Key? key;

  final int amount;

  final String userName;

  final String phoneNumber;

  final DateTime dateTime;

  final String bankName;

  @override
  String toString() {
    return 'PaymentSuccessRouteArgs{key: $key, amount: $amount, userName: $userName, phoneNumber: $phoneNumber, dateTime: $dateTime, bankName: $bankName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentSuccessRouteArgs) return false;
    return key == other.key &&
        amount == other.amount &&
        userName == other.userName &&
        phoneNumber == other.phoneNumber &&
        dateTime == other.dateTime &&
        bankName == other.bankName;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      amount.hashCode ^
      userName.hashCode ^
      phoneNumber.hashCode ^
      dateTime.hashCode ^
      bankName.hashCode;
}

/// generated route for
/// [_i27.ProfileDetailPage]
class ProfileDetailRoute extends _i34.PageRouteInfo<void> {
  const ProfileDetailRoute({List<_i34.PageRouteInfo>? children})
    : super(ProfileDetailRoute.name, initialChildren: children);

  static const String name = 'ProfileDetailRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i27.ProfileDetailPage();
    },
  );
}

/// generated route for
/// [_i28.ProfileNavigator]
class ProfileNavigator extends _i34.PageRouteInfo<void> {
  const ProfileNavigator({List<_i34.PageRouteInfo>? children})
    : super(ProfileNavigator.name, initialChildren: children);

  static const String name = 'ProfileNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i28.ProfileNavigator();
    },
  );
}

/// generated route for
/// [_i29.ProfilePage]
class ProfileRoute extends _i34.PageRouteInfo<void> {
  const ProfileRoute({List<_i34.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i29.ProfilePage();
    },
  );
}

/// generated route for
/// [_i30.SplashPage]
class SplashRoute extends _i34.PageRouteInfo<void> {
  const SplashRoute({List<_i34.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i30.SplashPage();
    },
  );
}

/// generated route for
/// [_i31.SubmitPaymentNumberPage]
class SubmitPaymentNumberRoute
    extends _i34.PageRouteInfo<SubmitPaymentNumberRouteArgs> {
  SubmitPaymentNumberRoute({
    _i35.Key? key,
    required String phoneNumber,
    required int total,
    required String serviceId,
    String? transactionId,
    required String driverId,
    required String userName,
    required _i38.BanksModel bank,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         SubmitPaymentNumberRoute.name,
         args: SubmitPaymentNumberRouteArgs(
           key: key,
           phoneNumber: phoneNumber,
           total: total,
           serviceId: serviceId,
           transactionId: transactionId,
           driverId: driverId,
           userName: userName,
           bank: bank,
         ),
         initialChildren: children,
       );

  static const String name = 'SubmitPaymentNumberRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubmitPaymentNumberRouteArgs>();
      return _i34.WrappedRoute(
        child: _i31.SubmitPaymentNumberPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          total: args.total,
          serviceId: args.serviceId,
          transactionId: args.transactionId,
          driverId: args.driverId,
          userName: args.userName,
          bank: args.bank,
        ),
      );
    },
  );
}

class SubmitPaymentNumberRouteArgs {
  const SubmitPaymentNumberRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.total,
    required this.serviceId,
    this.transactionId,
    required this.driverId,
    required this.userName,
    required this.bank,
  });

  final _i35.Key? key;

  final String phoneNumber;

  final int total;

  final String serviceId;

  final String? transactionId;

  final String driverId;

  final String userName;

  final _i38.BanksModel bank;

  @override
  String toString() {
    return 'SubmitPaymentNumberRouteArgs{key: $key, phoneNumber: $phoneNumber, total: $total, serviceId: $serviceId, transactionId: $transactionId, driverId: $driverId, userName: $userName, bank: $bank}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SubmitPaymentNumberRouteArgs) return false;
    return key == other.key &&
        phoneNumber == other.phoneNumber &&
        total == other.total &&
        serviceId == other.serviceId &&
        transactionId == other.transactionId &&
        driverId == other.driverId &&
        userName == other.userName &&
        bank == other.bank;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      phoneNumber.hashCode ^
      total.hashCode ^
      serviceId.hashCode ^
      transactionId.hashCode ^
      driverId.hashCode ^
      userName.hashCode ^
      bank.hashCode;
}

/// generated route for
/// [_i32.WebViewPage]
class WebViewRoute extends _i34.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    _i35.Key? key,
    required String url,
    required String title,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         WebViewRoute.name,
         args: WebViewRouteArgs(key: key, url: url, title: title),
         initialChildren: children,
       );

  static const String name = 'WebViewRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebViewRouteArgs>();
      return _i32.WebViewPage(key: args.key, url: args.url, title: args.title);
    },
  );
}

class WebViewRouteArgs {
  const WebViewRouteArgs({this.key, required this.url, required this.title});

  final _i35.Key? key;

  final String url;

  final String title;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, url: $url, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebViewRouteArgs) return false;
    return key == other.key && url == other.url && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ url.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i33.WithdrawalNavigator]
class WithdrawalNavigator extends _i34.PageRouteInfo<void> {
  const WithdrawalNavigator({List<_i34.PageRouteInfo>? children})
    : super(WithdrawalNavigator.name, initialChildren: children);

  static const String name = 'WithdrawalNavigator';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return _i34.WrappedRoute(child: const _i33.WithdrawalNavigator());
    },
  );
}
