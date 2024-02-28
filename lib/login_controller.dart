
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_scraper_app/loaders.dart';
import 'package:scholar_scraper_app/popups/full_screen_loader.dart';

import 'home_page.dart';


class LoginController extends GetxController{

  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        "assets/images/docerAnimation.json",
      );

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Check if email is already registered
      bool isEmailRegistered = await isEmailAlreadyRegistered(email.text.trim());

      if (!isEmailRegistered) {
        TFullScreenLoader.stopLoading();

        // Show error message for non-existing user
        TLoaders.errorSnackBar(title: "User Not Found",message: "No account found with this email address. Please check your email or create a new account.");
        return;
      }

      // Continue with Firebase login
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Stop loading
      TFullScreenLoader.stopLoading();
      // Clear input fields
      email.clear();
      password.clear();
      // Navigate to the home screen (you can replace MyHomePage with your home screen)
      Get.off(() => MyHomePage());

    } catch (e) {
      // Handle login errors
      TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: "Login Error",message: e.toString());

    }
  }

  Future<bool> isEmailAlreadyRegistered(String email) async {
    try {
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return true; // Email is registered
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return false; // Email is not registered
      } else {
        // Handle other FirebaseAuthExceptions as needed
        print('Error checking email registration: $e');
        return true; // Assume email is registered to be on the safe side
      }
    }
  }

}









