import 'package:flutter/material.dart';
import 'package:quick_help/common/styles/spacing_styles.dart';
import 'package:quick_help/features/authentication/screens/login_screen.dart';
import 'package:quick_help/features/authentication/screens/widgets/account_type_option_card.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/constants/image_strings.dart';
import 'package:quick_help/utils/constants/sizing.dart';
import 'package:quick_help/utils/constants/text_strings.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';
import 'package:quick_help/common/widgets/form_divider.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: QSpacingStyles.paddingWithAppBar,
          child:
          //Main Column
          Column(
            children: [
              //Logo, Title and Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      isDark ? QImages.logoWhite : QImages.logoBlue,
                    ),
                    height: 240,
                    width: 240,
                  ),

                  Text(
                    QTextStrings.accountTypeSelectionTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: QSizes.sm),
                  Text(
                    QTextStrings.accountTypeSelectionSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: QSizes.spaceBtwSections),

              //Buttons for Account Types
              // Consumer Card
              AccountTypeOptionCard(
                image: QImages.consumer01,
                title: QTextStrings.consumer,
                subtitle: QTextStrings.consumerAccountTypeSubtitle,
                onTap: () {
                  // Navigate to consumer screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: QSizes.spaceBtwButtons),

              // Service Provider Card
              AccountTypeOptionCard(
                image: QImages.worker01,
                title: QTextStrings.serviceProvider,
                subtitle: QTextStrings.serviceProviderAccountTypeSubtitle,
                onTap: () {
                  // Navigate to provider screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: QSizes.spaceBtwInputFields),

              // Divider
              const QFormDividerWithOr(),

              const SizedBox(height: QSizes.spaceBtwInputFields),

              // Guest button
              GestureDetector(
                onTap: () {
                  // Continue as guest
                },
                child: Container(
                  width: double.infinity,
                  padding: QSpacingStyles.paddingInsideButton,
                  decoration: BoxDecoration(
                    border: Border.all(color: QAppColors.shade2, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: isDark ? QAppColors.darkText : QAppColors.text,
                      ),
                      const SizedBox(width: QSizes.sm),
                      Text('Continue as a guest'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
