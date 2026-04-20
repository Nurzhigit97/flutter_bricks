import 'package:flutter/material.dart';
import 'package:work_up/shared/widgets/select_image/app_network_image_widget.dart';

class AppSliderWidget extends StatefulWidget {
  final List<String> images;
  const AppSliderWidget({super.key, required this.images});

  @override
  State<AppSliderWidget> createState() => _AppSliderWidgetState();
}

class _AppSliderWidgetState extends State<AppSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.images.isNotEmpty)
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              physics: widget.images.length > 1
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(right: 16),
              itemBuilder: (context, index) {
                final screenWidth = MediaQuery.sizeOf(context).width;
                final paddingWidth = widget.images.length > 1 ? 16 : 40;
                final imageWidth = widget.images.length > 1
                    ? 280.0
                    : screenWidth - paddingWidth;

                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: AppNetworkImageWidget(
                    imageUrl: widget.images[index],
                    width: imageWidth,
                    isFullScreen: true,
                    imageUrls: widget.images,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(12),
                    index: index,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
