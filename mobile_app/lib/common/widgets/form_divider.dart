import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/constants/sizing.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

class QFormDividerWithOr extends StatelessWidget {
  const QFormDividerWithOr({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: isDark ? QAppColors.darkText : QAppColors.lightText,
            thickness: 0.8,
            indent: QSizes.xl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(QSizes.md),
          child: Text(
            "or",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300),
          ),
        ),
        Expanded(
          child: Divider(
            color: isDark ? QAppColors.darkText : QAppColors.lightText,
            thickness: 0.8,
            endIndent: QSizes.xl,
          ),
        ),
      ],
    );
  }
}
