
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholar_scraper_app/popups/full_screen_loader.dart';
import 'package:scholar_scraper_app/reset_password.dart';


class ForgetPasswordController extends GetxController{
static ForgetPasswordController get instance => Get.find();

// variables
final email = TextEditingController();
GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
// Send Rest Password Email
sendPasswordRestEmail() async {
  try {
    // Start Loading
    TFullScreenLoader.openLoadingDialog('Processing your request...', "assets/images/docerAnimation.json");

    // Form Validation
    if(!forgetPasswordFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;
    }

    await SendPasswordRestEmail(email.text.trim());

    // Remove Loader
    TFullScreenLoader.stopLoading();
// Show Success Screen
    Get.snackbar(
      "Email Sent",
      "Email Link Sent to Reset your Password",
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Color(0xFF4b68ff),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon:  Icon(Iconsax.check,color: Colors.white.withOpacity(0.1),),
    );
    // Show Success Screen
    Get.snackbar(
      "Email Sent",
      "Email Link Sent to Reset your Password",
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Color(0xFF4b68ff),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check,color: Colors.white,),
    );
    // Redirect
    Get.to(()=>ResetPasswordScreen(email:email.text.trim()));
  } catch (e) {
// Remove Loader
    TFullScreenLoader.stopLoading();
    Get.snackbar(
      "Oh Snap",
      e.toString(),
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2,color: Colors.white,),
    );
  }
}
  resendPasswordRestEmail(String email) async{
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', "assets/images/docerAnimation.json");

      await SendPasswordRestEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      Get.snackbar(
        "Email Sent",
        "Email Link Sent to Reset your Password",
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Color(0xFF4b68ff),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        icon: const Icon(Iconsax.check,color: Colors.white,),
      );
    } catch (e) {
// Remove Loader
      TFullScreenLoader.stopLoading();
      Get.snackbar(
        "Oh Snap",
        e.toString(),
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2,color: Colors.white,),
      );
    }
  }
  // [EmailAuthentication] Forget Password
  Future<void> SendPasswordRestEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    }  catch (e) {
      throw 'Something went Wrong. Please try again';
    }
  }
}