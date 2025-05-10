import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/constants/image_strings.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

class QBottomNavBar extends StatelessWidget {
  const QBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      currentIndex: 0, // Set a default index
      onTap: (index) {
        // Handle navigation logic here
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: isDark ? QAppColors.darkText : QAppColors.lightText,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedItemColor: isDark?QAppColors.transparentWhite:QAppColors.transparentBlack,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            QImages.navHomeIcon,
            colorFilter: ColorFilter.mode(
              isDark ? QAppColors.darkText : QAppColors.lightText,
              BlendMode.srcIn,
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            QImages.navRequestIcon,
            colorFilter: ColorFilter.mode(
              isDark ? QAppColors.darkText : QAppColors.lightText,
              BlendMode.srcIn,
            ),
          ),
          label: "Request",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            QImages.navMessageIcon,
            colorFilter: ColorFilter.mode(
              isDark ? QAppColors.darkText : QAppColors.lightText,
              BlendMode.srcIn,
            ),
          ),
          label: "Messages",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            QImages.navMoreIcon,
            colorFilter: ColorFilter.mode(
              isDark ? QAppColors.darkText : QAppColors.lightText,
              BlendMode.srcIn,
            ),
          ),
          label: "More",
        ),
      ],
    );
  }
}
