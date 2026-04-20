import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:work_up/shared/widgets/app_loader_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

@RoutePage()
class AppSeeFullImagesPage extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const AppSeeFullImagesPage({
    super.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  createState() => _AppSeeFullImagesPageState();
}

class _AppSeeFullImagesPageState extends State<AppSeeFullImagesPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          widget.imageUrls.isNotEmpty
              ? PhotoViewGallery.builder(
                  itemCount: widget.imageUrls.length,
                  scrollPhysics: const ClampingScrollPhysics(),
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.imageUrls[index]),
                      minScale: PhotoViewComputedScale.contained * 0.8,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      heroAttributes: PhotoViewHeroAttributes(
                        tag: widget.imageUrls[index],
                      ),
                    );
                  },
                  loadingBuilder: (context, event) => const AppLoaderWidget(),
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  pageController: PageController(
                    initialPage: _currentIndex,
                    viewportFraction: 1.0,
                  ),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                )
              : const Center(child: Icon(Icons.image)),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${_currentIndex + 1} / ${widget.imageUrls.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
