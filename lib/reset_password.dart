import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forget_password_controller.dart';
import 'login_screen.dart';
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
       child:Padding(
         padding: const EdgeInsets.all(24.0),
         child: Column(
           children: [
             // Image
             Image(image: const AssetImage("assets/images/sammy-line-man-receives-a-mail.png"),
               width: MediaQuery.of(Get.context!).size.width*0.6,
             ),
             const SizedBox(height: 32.0,),
             // Email Title & SubTitle
             Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
             const SizedBox(height: 32.0,),
             Text(
               "Password Rest Email sent",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
             const SizedBox(height: 16.0,),
             Text("Your Account security is Our priority! we've Sent You a secure Link to Safely Change Your Password and Keep Your Account Protected",style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
             const SizedBox(height: 32.0,),

             // Button
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: ()=>Get.offAll(()=>LoginScreen()),
                 child: const Text("Done"),
               ),
             ),
             const SizedBox(height: 16.0,),
             SizedBox(
               width: double.infinity,
               child: TextButton(
                 onPressed: ()=> ForgetPasswordController.instance.resendPasswordRestEmail(email),
                 child: const Text("Resend Email"),
               ),
             ),

           ],
         ),
       ),
      ),
    );
  }
}
