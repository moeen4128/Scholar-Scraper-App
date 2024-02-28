
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key, required this.title, required this.image, required this.subTitle, required this.onPressed}) : super(key: key);

  final String title,image,subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight *2,
          child: Column(
            children: [
              // Image
              // Image(image: AssetImage(image),
              //   width: THelperFunctios.screenWidth()*0.6,
              // ),
              Lottie.asset(image,
                  width: MediaQuery.of(context).size.width*0.6),
              const SizedBox(height: 32.0,),
              // Title & SubTitle
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: 16.0,),
              Text(subTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: 32.0,),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
class TSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: 56.0,
    left: 24.0,
    right: 24.0,
    bottom: 24.0,
  );
}