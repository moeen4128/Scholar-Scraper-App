import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholar_scraper_app/signup_controller.dart';
import 'package:scholar_scraper_app/terms_condition_checkbox.dart';
import 'package:scholar_scraper_app/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
        child: Column(
      children: [
        // First & Last Name
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value)=>TValidator.validateEmptyText('First name', value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value)=>TValidator.validateEmptyText('Last name', value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),

        // Username
        TextFormField(
          controller: controller.username,
          validator: (value)=>TValidator.validateEmptyText('Username', value),
          expands: false,
          decoration: const InputDecoration(
            labelText: "UserName",
            prefixIcon: Icon(Iconsax.user_edit),
          ),
        ),

        const SizedBox(
          height: 16.0,
        ),

        // Email
        TextFormField(
          controller: controller.email,
          validator: (value)=>TValidator.validateEmail(value),
          expands: false,
          decoration: const InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),

        const SizedBox(
          height: 16.0,
        ),

        // Phone Number
        TextFormField(
          controller: controller.phoneNo,
          validator: (value)=>TValidator.validatePhoneNumber(value),
          expands: false,
          decoration: const InputDecoration(
            labelText: "Phone Number",
            prefixIcon: Icon(Iconsax.call),
          ),
        ),

        const SizedBox(
          height: 16.0,
        ),

        // Password
        Obx(
         ()=> TextFormField(
            controller: controller.password,
            validator: (value)=>TValidator.validatePassword(value),
            expands: false,
            obscureText: controller.hidePassword.value,
            decoration:  InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(onPressed: ()=>controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
            ),
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),

        // Terms&Condition Checkbox
        const TTermsAndConditionCheckBox(),

        const SizedBox(
          height: 32.0,
        ),
        // Sign Up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text("Create Account")),
        )
      ],
    ));
  }
}
