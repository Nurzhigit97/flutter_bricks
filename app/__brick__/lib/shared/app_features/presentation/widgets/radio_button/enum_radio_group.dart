import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/app_features/presentation/widgets/radio_button/enum_radio_option.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';

class EnumRadioGroup<T> extends StatelessWidget {
  final String label;
  final List<EnumRadioOption<T>> options;
  final T? selectedValue;
  final void Function(T) onChanged;
  final bool isRequired;

  const EnumRadioGroup({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.hintColor,
          ),
        ),
        Wrap(
          spacing: 16,

          children: options.map((option) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<T>(
                  activeColor: AppColors.focusLight,

                  value: option.value,
                  // ignore: deprecated_member_use
                  groupValue: selectedValue,
                  // ignore: deprecated_member_use
                  onChanged: (val) {
                    if (val != null) onChanged(val);
                  },
                ),
                GestureDetector(
                  onTap: () => onChanged(option.value),
                  child: Text(
                    option.label,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
