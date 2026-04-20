import 'package:flutter/material.dart';
import 'package:work_up/shared/widgets/app_search_widget.dart';
import 'package:work_up/core/helper/extensions.dart';

/// Unified class for showing bottom sheets across the app
@immutable
final class AppBottomSheet {
  /// Shows a basic bottom sheet with customizable size
  static Future<T?> showBottomSheet<T>(
    BuildContext context,
    Widget child, {
    double initialChildSize = 0.6,
    Key? scrollKey,
    bool isDragHandle = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (c, s) {
            return Column(
              children: [
                const SizedBox(height: 8),
                if (isDragHandle)
                  const SizedBox(
                    height: 30,
                    child: Icon(Icons.maximize_rounded, size: 50),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    key: scrollKey,
                    physics: const BouncingScrollPhysics(),
                    controller: s,
                    child: child,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Shows a bottom sheet with a title and back button
  static Future<T?> showBottomSheetWithTitle<T>(
    BuildContext context,
    Widget child, {
    double initialChildSize = 0.6,
    required String title,
    Key? scrollKey,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: 0.4,
          expand: false,
          builder: (c, s) {
            return Column(
              children: [
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.arrow_back_ios_new_outlined),
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    key: scrollKey,
                    physics: const BouncingScrollPhysics(),
                    controller: s,
                    child: child,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Shows a bottom sheet with a list of widgets separated by dividers
  static void showBottomListWidget(
    BuildContext context, {
    required List<Widget> list,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      useSafeArea: true,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) => list[index],
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey.withAlpha(3)),
              itemCount: list.length,
            ),
          ),
        );
      },
    );
  }

  /// Shows a selection bottom sheet with search functionality
  static Future<T?> showSelectionBottomSheet<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T) getTitle,
    T? selectedItem,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final scheme = context.colorScheme;
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.7,
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                AppSearchWidget(onChanged: (value) {}),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final isSelected =
                          selectedItem != null &&
                          getTitle(selectedItem) == getTitle(item);

                      return ListTile(
                        title: Text(
                          getTitle(item),
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? scheme.primary
                                : scheme.onSurface,
                          ),
                        ),
                        trailing: isSelected
                            ? Icon(
                                Icons.check,
                                color: scheme.primary,
                              )
                            : null,
                        onTap: () => Navigator.pop(context, item),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Shows a simple alert dialog
  static Future<T?> showAlertDialog<T>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return AlertDialog(content: child);
      },
    );
  }
}
