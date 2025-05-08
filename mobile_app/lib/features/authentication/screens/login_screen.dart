import 'package:flutter/material.dart';
import 'package:quick_help/common/styles/spacing_styles.dart';
import 'package:quick_help/features/authentication/controllers/login_register_controller.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/constants/image_strings.dart';
import 'package:quick_help/utils/constants/sizing.dart';
import 'package:quick_help/utils/constants/text_strings.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:quick_help/utils/validators/validation.dart';

import '../../../common/widgets/form_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);

    // Initialize the controller if not already done
    final controller = Get.put(LoginRegisterController());

    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: QSpacingStyles.paddingWithAppBar,
          child:
          //Main Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    QTextStrings.loginRegister,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.role.value.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w200,
                        color:
                            isDark
                                ? QAppColors.transparentWhite
                                : QAppColors.transparentBlack,
                      ),
                    ),
                  ),
                ],
              ),

              //Form
              Form(
                key: controller.formKey, // Form key for validation
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: QSizes.spaceBtwSections,
                    bottom: QSizes.spaceBtwInputFields,
                  ),
                  child: Column(
                    children: [
                      //Email TextField
                      TextFormField(
                        controller: controller.email,
                        validator:
                            (value) => QValidation.isEmpty("Email", value),
                        decoration: InputDecoration(
                          labelText: QTextStrings.enterEmail,
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                      ),

                      const SizedBox(height: QSizes.spaceBtwInputFields),

                      //Password TextField
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          validator:
                              (value) => QValidation.validatePassword(value),
                          obscureText:
                              controller.hidePassword.value, // Hide password
                          decoration: InputDecoration(
                            labelText: QTextStrings.enterPassword,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.hidePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              },
                            ),
                          ),
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
                              Obx(
                                () => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) {
                                    controller.rememberMe.value =
                                        value ?? false;
                                  },
                                ),
                              ),
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
                          onPressed: () {
                            //Send Login / Register Request
                            controller.loginSignUp();
                          },
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
