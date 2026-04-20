import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final bool isSelected;
  final String title;

  const CardWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Colors.black : Colors.white,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.black,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Padding(padding: const EdgeInsets.all(8.0), child: icon),
            ),
          ),
        ],
      ),
    );
  }
}
