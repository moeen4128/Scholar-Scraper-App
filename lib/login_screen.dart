import 'package:flutter/material.dart';

import 'login_form.dart';
import 'login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 56.0,
            left: 24.0,
            right: 24.0,
            bottom: 24.0,
          ),
          child: Column(
            children: [
              // Logo Title & Sub-Title
               TLoginHeader(),
              // Form
               TLoginForm(),


            ],
          ),
        ),
      ),
    );
  }
}
