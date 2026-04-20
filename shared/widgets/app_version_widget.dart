import 'package:flutter/material.dart';
import 'package:work_up/core/helper/extensions.dart';
import 'package:work_up/core/helper/helper.dart';
import 'package:work_up/shared/widgets/app_future_builder_widget.dart';
import 'package:work_up/core/translation/generated/l10n.dart';

class AppVersionWidget extends StatelessWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFutureBuilder<String>(
      future: Helper.getVersion(),
      onData: (data) => Text(
        '${S.of(context).version} $data',
        style: context.theme.textTheme.bodySmall,
      ),
    );
  }
}
