// date of birth validator method
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/widgets/app_button_with_icon_widget.dart';
import 'package:{{packageName}}/core/translation/generated/l10n.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';

Future<void> selectedDateOfBirthDialog(
  BuildContext context,
  DateTime? initialDate,
  Function(DateTime) onDateChanged,
) async {
  DateTime selectedDate = initialDate ?? DateTime(2000, 1, 1);
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    useSafeArea: true,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDate ?? DateTime(2000, 1, 1),
                minimumYear: 1900,
                maximumYear: DateTime.now().year,
                onDateTimeChanged: (DateTime date) {
                  selectedDate = date;
                  onDateChanged(date);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 30, left: 16),
              child: AppButtonWithIconWidget(
                title: S.of(context).select,
                bgColor: AppColors.focusLight,
                onTap: () {
                  onDateChanged(selectedDate);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
