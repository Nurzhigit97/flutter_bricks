import 'dart:io';
import 'package:{{packageName}}/shared/widgets/select_image/app_error_network_image_widget.dart';
import 'package:{{packageName}}/core/routes/app_routes.gr.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppNetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData? errorIcon;
  final double? errorIconSize;
  final Color? errorBackgroundColor;
  final Color? errorIconColor;
  final EdgeInsets? padding;
  final int? index;
  final bool? isFullScreen;
  final List<String>? imageUrls;

  const AppNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.imageFile,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.errorIcon,
    this.errorIconSize,
    this.errorBackgroundColor = AppColors.mainLight,
    this.errorIconColor,
    this.padding,
    this.index,
    this.isFullScreen = false,
    this.imageUrls,
  });

  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLocalImage = imageFile != null;

    // Проверяем, есть ли валидный URL для загрузки
    final bool hasValidUrl =
        imageUrl != null &&
        imageUrl!.isNotEmpty &&
        (imageUrl!.startsWith('http://') ||
            imageUrl!.startsWith('https://') ||
            imageUrl!.startsWith('file://'));

    Widget imageWidget = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: isLocalImage
          ? Image.file(imageFile!, width: width, height: height, fit: fit)
          : hasValidUrl
          ? DecoratedBox(
              decoration: const BoxDecoration(color: AppColors.white),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                width: width,
                height: height,
                filterQuality: FilterQuality.medium,
                fit: fit,
                placeholder: (context, url) => _buildShimmerPlaceholder(),
                errorWidget: (context, url, error) =>
                    AppErrorNetworkImageWidget(
                      width: width,
                      height: height,
                      icon: errorIcon,
                      iconSize: errorIconSize,
                      backgroundColor: errorBackgroundColor,
                      iconColor: errorIconColor,
                      borderRadius: borderRadius,
                      padding: padding,
                    ),
              ),
            )
          : AppErrorNetworkImageWidget(
              width: width,
              height: height,
              icon: errorIcon,
              iconSize: errorIconSize,
              backgroundColor: errorBackgroundColor,
              iconColor: errorIconColor,
              borderRadius: borderRadius,
              padding: padding,
            ),
    );

    return GestureDetector(
      onTap: isFullScreen != null && isFullScreen == true
          ? () {
              if (imageUrls != null) {
                context.pushRoute(
                  AppSeeFullImagesRoute(
                    imageUrls: imageUrls ?? [],
                    initialIndex: index ?? 0,
                  ),
                );
              } else {
                // If a local image file is provided, open it in full screen
                if (imageFile != null) {
                  context.pushRoute(
                    AppSeeFullImageRoute(
                      imageUrl: imageFile!.path,
                      index: index,
                    ),
                  );
                } else if (imageUrl != null && imageUrl!.isNotEmpty) {
                  context.pushRoute(
                    AppSeeFullImageRoute(imageUrl: imageUrl!, index: index),
                  );
                }
              }
            }
          : null,
      child: imageWidget,
    );
  }
}

final customCacheManager = CacheManager(
  Config(
    'customCacheKey',
    stalePeriod: const Duration(days: 5),
    maxNrOfCacheObjects: 100,
    repo: JsonCacheInfoRepository(databaseName: 'customCache'),
    fileService: HttpFileService(),
  ),
);
