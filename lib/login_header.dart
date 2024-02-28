import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 100,
            image: AssetImage("assets/logos/Web-Scraper-Icon-Logo-Vector.svg-.png")),
        Text(
          "welcome back",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          "Explore, discover, and organize scholarly publications effortlessly.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
