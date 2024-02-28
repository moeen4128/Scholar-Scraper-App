
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
        title,
        message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Color(0xFF4b68ff),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon:  Icon(Iconsax.check,color: Colors.white.withOpacity(0.1),),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon:  Icon(Iconsax.warning_2,color: Colors.white.withOpacity(0.1),),
    );
  }
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon:  Icon(Iconsax.warning_2,color: Colors.white.withOpacity(0.1),),
    );
  }
}