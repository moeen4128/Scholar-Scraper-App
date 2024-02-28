import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_scraper_app/verify_email_controller.dart';

import 'login_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key, this.email}) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage("assets/images/sammy-line-man-receives-a-mail.png"),
                width: MediaQuery.of(Get.context!).size.width* 0.6,
              ),
              const SizedBox(
                height: 32.0,
              ),
              // Title & SubTitle
              Text(
                "Verify Your email address!",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Congratulations! Your account is ready for Scholar Scraper. Verify your email to unlock the full potential of scholarly data analysis.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32.0,
              ),
              // Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    controller.sendEmailVerification();
                  },
                  child: const Text("Resend Email"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    }  catch (e) {
      throw 'Something went Wrong. Please try again';
    }
  }
}
