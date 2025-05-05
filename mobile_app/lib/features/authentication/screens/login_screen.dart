import 'package:flutter/material.dart';
import 'package:quick_help/common/styles/spacing_styles.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/constants/image_strings.dart';
import 'package:quick_help/utils/constants/sizing.dart';
import 'package:quick_help/utils/constants/text_strings.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

import '../../../common/widgets/form_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Back Arrow
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: isDark ? QAppColors.darkText : QAppColors.lightText,
                ),
                onPressed: () {},
              ),

              //Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    QTextStrings.loginRegister,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              //Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: QSizes.spaceBtwSections,
                    bottom: QSizes.spaceBtwInputFields,
                  ),
                  child: Column(
                    children: [
                      
                      //Email TextField
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: QTextStrings.enterEmail,
                        ),
                      ),

                      const SizedBox(height: QSizes.spaceBtwInputFields),

                      //Password TextField
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: QTextStrings.enterPassword,
                        ),
                      ),

                      const SizedBox(height: QSizes.spaceBtwInputFields / 2),

                      //Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Remember Me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(QTextStrings.rememberMe),
                            ],
                          ),

                          //Forgot Password
                          TextButton(
                            onPressed: () {},
                            child: const Text(QTextStrings.forgotPassword),
                          ),
                        ],
                      ),

                      const SizedBox(height: QSizes.spaceBtwInputFields),

                      //Continue Button
                      SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isDark
                                    ? QAppColors.lightButtonColor
                                    : QAppColors.buttonColor,
                          ),
                          child: Padding(
                            padding: QSpacingStyles.paddingInsideButton,
                            child: Text(
                              QTextStrings.continue_,
                              style: TextStyle(
                                color:
                                    isDark
                                        ? QAppColors.lightText
                                        : QAppColors.darkText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Divider with or
              const QFormDividerWithOr(),

              const SizedBox(height: QSizes.spaceBtwInputFields),

              // Continue with Google Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(QImages.google, height: 20, width: 20),
                  label: Padding(
                    padding: QSpacingStyles.paddingInsideButton,
                    child: Text(QTextStrings.continueWithGoogle),
                  ),
                ),
              ),

              //Disclaimer
              Padding(
                padding: const EdgeInsets.only(top: QSizes.spaceBtwSections),
                child: Text(
                  QTextStrings.disclaimer,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        isDark
                            ? QAppColors.transparentWhite
                            : QAppColors.transparentBlack,
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
