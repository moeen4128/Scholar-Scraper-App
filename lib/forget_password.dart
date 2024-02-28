import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholar_scraper_app/validators/validation.dart';

import 'forget_password_controller.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              "Forget password",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height:16.0,
            ),
            Text(
              "Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.",
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32.0 * 2,
            ),

            // Text Field

            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordRestEmail(), // (Get.off) when I press the back Button then redirect to Login Screen
                  child: const Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}
