
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_scraper_app/loaders.dart';
import 'package:scholar_scraper_app/popups/full_screen_loader.dart';
import 'package:scholar_scraper_app/verify_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  // Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNo = TextEditingController();
  GlobalKey<FormState> signupFormKey =
  GlobalKey<FormState>(); //Form Key for from validation

  // SIGNUP
  void signup() async {
    try {
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(title: "Accept Privacy Policy",message: "In order to create an account, you must read and accept the Privacy Policy & Terms of use.");

        return;
      }
      // start loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        "assets/images/docerAnimation.json",
      );


      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication
       await registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());
      // Clear input fields
      email.clear();
      lastName.clear();
      username.clear();
      password.clear();
      firstName.clear();
      phoneNo.clear();

      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show Success Message
    TLoaders.successSnackBar(title: "Congratulations",message: "Your account has been created! Verify email to continue.");

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Clear input fields on error as well
      email.clear();
      lastName.clear();
      username.clear();
      password.clear();
      firstName.clear();
      phoneNo.clear();
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());

    }
  }
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Something went Wrong. Please try again';
    }
  }
}
