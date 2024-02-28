import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scholar_scraper_app/home_page.dart';
import 'package:scholar_scraper_app/loaders.dart';
import 'package:scholar_scraper_app/success_screen.dart';
import 'package:scholar_scraper_app/verify_screen.dart';

import 'login_screen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  // Send Email Whenever Verify Screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    super.onInit();
  }

  // Send Email Verification link
  sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      Get.snackbar(
        'Email Sent',
        'Please Check your inbox and verify your email.',
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Color(0xFF4b68ff),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        icon:  Icon(Iconsax.check,color: Colors.white.withOpacity(0.1),),
      );
    } catch (e) {
      TLoaders.warningSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            title: "Your account successfully created!",
            image: "assets/images/successfullyRegisterAnimation.json",
            subTitle: "Welcome to Scholar Scraper! Your account is now verified, unlocking the joy of seamless scholarly exploration.",
            onPressed: () => screenRedirect()));
      }
    });
  }

  // Manually check if Email verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
          title: "Your account successfully created!",
          image: "assets/images/successfullyRegisterAnimation.json",
          subTitle: "Welcome to Scholar Scraper! Your account is now verified, unlocking the joy of seamless scholarly exploration.",
          onPressed: () => screenRedirect()));
    }
  }
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.off(() => MyHomePage());
      } else {
        Get.off(() => VerifyEmailScreen(
          email: _auth.currentUser?.email,
        ));
      }
    } else {
      Get.off(() => const LoginScreen());
    }
  }

}
