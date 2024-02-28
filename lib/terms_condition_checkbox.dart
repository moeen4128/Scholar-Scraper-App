import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_scraper_app/signup_controller.dart';




class TTermsAndConditionCheckBox extends StatelessWidget {
  const TTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value) =>controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Text.rich(
              TextSpan(children: [
            TextSpan(
                text: 'I agree to',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: 'privacy Poilicy',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color:Color(0xFF4b68ff),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF4b68ff))),
            TextSpan(
                text: 'and',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: "Terms of use",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Color(0xFF4b68ff),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF4b68ff))),
          ])),
        ),
      ],
    );
  }
}
