import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text,String animation) {
    showDialog(
        context: Get.overlayContext!,
        // Use Get.overlayContext for overlay dialog
        barrierDismissible: false,
        // The dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, // Disable poping with the back button
            child: Container(
              color:  Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  TAnimationLoaderWidget(
                    text: text,
                    animation: animation,
                  ),
                ],
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
