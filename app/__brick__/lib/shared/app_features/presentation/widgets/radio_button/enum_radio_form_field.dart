import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/app_features/presentation/widgets/radio_button/enum_radio_group.dart';
import 'package:{{packageName}}/shared/app_features/presentation/widgets/radio_button/enum_radio_option.dart';
import 'package:{{packageName}}/shared/core/helper/extenstions.dart';

class EnumRadioFormField<T> extends FormField<T> {
  EnumRadioFormField({
    super.key,
    required String label,
    required BuildContext context,
    required List<EnumRadioOption<T>> options,
    super.initialValue,
    bool isRequired = false,
    super.onSaved,
    FormFieldValidator<T>? validator,
    void Function(T)? onChanged,
  }) : super(
         validator:
             validator ??
             (val) {
               if (isRequired && val == null) return context.tr.fieldIsRequired;
               return null;
             },
         builder: (state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               EnumRadioGroup<T>(
                 label: label,
                 options: options,
                 selectedValue: state.value ?? initialValue,
                 onChanged: (val) {
                   state.didChange(val);
                   if (onChanged != null) onChanged(val);
                 },
                 isRequired: isRequired,
               ),
               if (state.hasError)
                 Text(
                   state.errorText ?? '',
                   style: (const TextStyle(color: Colors.red, fontSize: 12)),
                 ),
             ],
           );
         },
       );
}
