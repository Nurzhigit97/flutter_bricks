// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:{{packageName}}/features/home/home_navigator.dart' as _i5;
import 'package:{{packageName}}/features/home/presentation/pages/home_page.dart'
    as _i6;
import 'package:{{packageName}}/features/main_page.dart' as _i7;
import 'package:{{packageName}}/shared/app_features/presentation/pages/app_pdf_view_page.dart'
    as _i1;
import 'package:{{packageName}}/shared/app_features/presentation/pages/splash_page.dart'
    as _i8;
import 'package:{{packageName}}/shared/app_features/presentation/pages/tab_view_page.dart'
    as _i4;
import 'package:{{packageName}}/shared/app_features/presentation/pages/web_view_page.dart'
    as _i9;
import 'package:{{packageName}}/shared/widgets/select_image/app_full_screen_image_page.dart'
    as _i2;
import 'package:{{packageName}}/shared/widgets/select_image/app_full_screen_images_page.dart'
    as _i3;
import 'package:collection/collection.dart' as _i12;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.AppPdfViewPage]
class AppPdfViewRoute extends _i10.PageRouteInfo<AppPdfViewRouteArgs> {
  AppPdfViewRoute({
    _i11.Key? key,
    required String pdfUrl,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         AppPdfViewRoute.name,
         args: AppPdfViewRouteArgs(key: key, pdfUrl: pdfUrl),
         initialChildren: children,
       );

  static const String name = 'AppPdfViewRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppPdfViewRouteArgs>();
      return _i1.AppPdfViewPage(key: args.key, pdfUrl: args.pdfUrl);
    },
  );
}

class AppPdfViewRouteArgs {
  const AppPdfViewRouteArgs({this.key, required this.pdfUrl});

  final _i11.Key? key;

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
    extends _i10.PageRouteInfo<AppSeeFullImageRouteArgs> {
  AppSeeFullImageRoute({
    _i11.Key? key,
    required String imageUrl,
    int? index,
    List<_i10.PageRouteInfo>? children,
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

  static _i10.PageInfo page = _i10.PageInfo(
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

  final _i11.Key? key;

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
    extends _i10.PageRouteInfo<AppSeeFullImagesRouteArgs> {
  AppSeeFullImagesRoute({
    _i11.Key? key,
    required List<String> imageUrls,
    required int initialIndex,
    List<_i10.PageRouteInfo>? children,
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

  static _i10.PageInfo page = _i10.PageInfo(
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

  final _i11.Key? key;

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
        const _i12.ListEquality<String>().equals(imageUrls, other.imageUrls) &&
        initialIndex == other.initialIndex;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i12.ListEquality<String>().hash(imageUrls) ^
      initialIndex.hashCode;
}

/// generated route for
/// [_i4.CustomTabbarPage]
class CustomTabbarRoute extends _i10.PageRouteInfo<CustomTabbarRouteArgs> {
  CustomTabbarRoute({
    _i11.Key? key,
    required List<String> tabs,
    required List<_i11.Widget> tabViews,
    bool? isChildView,
    List<_i10.PageRouteInfo>? children,
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

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomTabbarRouteArgs>();
      return _i4.CustomTabbarPage(
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

  final _i11.Key? key;

  final List<String> tabs;

  final List<_i11.Widget> tabViews;

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
        const _i12.ListEquality<String>().equals(tabs, other.tabs) &&
        const _i12.ListEquality<_i11.Widget>().equals(
          tabViews,
          other.tabViews,
        ) &&
        isChildView == other.isChildView;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i12.ListEquality<String>().hash(tabs) ^
      const _i12.ListEquality<_i11.Widget>().hash(tabViews) ^
      isChildView.hashCode;
}

/// generated route for
/// [_i5.HomeNavigator]
class HomeNavigator extends _i10.PageRouteInfo<void> {
  const HomeNavigator({List<_i10.PageRouteInfo>? children})
    : super(HomeNavigator.name, initialChildren: children);

  static const String name = 'HomeNavigator';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return _i10.WrappedRoute(child: const _i5.HomeNavigator());
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomePage();
    },
  );
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainPage();
    },
  );
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashPage();
    },
  );
}

/// generated route for
/// [_i9.WebViewPage]
class WebViewRoute extends _i10.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    _i11.Key? key,
    required String url,
    required String title,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         WebViewRoute.name,
         args: WebViewRouteArgs(key: key, url: url, title: title),
         initialChildren: children,
       );

  static const String name = 'WebViewRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebViewRouteArgs>();
      return _i9.WebViewPage(key: args.key, url: args.url, title: args.title);
    },
  );
}

class WebViewRouteArgs {
  const WebViewRouteArgs({this.key, required this.url, required this.title});

  final _i11.Key? key;

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
