import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholar_scraper_app/signup.dart';
import 'package:scholar_scraper_app/validators/validation.dart';

import 'forget_password.dart';
import 'login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "E-mail",
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0 / 2,
            ),
            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Obx(
                ()=> Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                    ),
                    const Text("Remember Me")
                  ],
                ),

                // Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text("Forget Password")),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),

            // SingIn Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(

                    onPressed: () =>  controller.emailAndPasswordSignIn(),
                    child: const Text("Sign In"))),
            const SizedBox(
              height: 16.0,
            ),
            // Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text("Create Account"))),
          ],
        ),
      ),
    );
  }
}
