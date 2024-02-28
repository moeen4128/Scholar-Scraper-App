import 'package:flutter/material.dart';

import 'package:scholar_scraper_app/signup_form.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: 32.0,
              ),
              // Form
              const TSignupForm(),

            ],
          ),
        ),
      ),
    );
  }
}
