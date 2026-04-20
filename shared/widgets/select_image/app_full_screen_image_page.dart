import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:work_up/shared/widgets/app_loader_widget.dart';

@RoutePage()
class AppSeeFullImagePage extends StatelessWidget {
  final String imageUrl;
  final int? index;

  const AppSeeFullImagePage({super.key, required this.imageUrl, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: imageUrl.isNotEmpty
          ? PhotoView(
              imageProvider: _getImageProvider(),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
              backgroundDecoration: const BoxDecoration(color: Colors.black),
              loadingBuilder: (context, event) => const AppLoaderWidget(),
            )
          : const Center(child: Icon(Icons.image)),
    );
  }

  ImageProvider _getImageProvider() {
    // Проверяем, является ли это локальным файлом
    if (imageUrl.startsWith('/') || imageUrl.startsWith('file://')) {
      return FileImage(File(imageUrl.replaceFirst('file://', '')));
    }
    // Иначе это URL
    return NetworkImage(imageUrl);
  }
}
