import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

class QAccountTypeOptionCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const QAccountTypeOptionCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);

    return Card(
      elevation: 4,
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: QAppColors.shade4, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(image, width: 50, height: 50),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isDark ? QAppColors.darkText : QAppColors.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? QAppColors.darkText : QAppColors.text,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: isDark ? QAppColors.darkText : QAppColors.text,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
