import 'package:flutter/material.dart';

class THomeHeader extends StatelessWidget {
  const THomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 90,
            image: AssetImage("assets/logos/Web-Scraper-Icon-Logo-Vector.svg-.png")),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          "Uncover Scholarly Achievements: Enter a Google Scholar link and year to reveal author details and publication count effortlessly.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
