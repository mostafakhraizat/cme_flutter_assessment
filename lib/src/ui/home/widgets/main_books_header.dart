import 'package:flutter/material.dart';

class MainBooksHeader extends StatelessWidget {
  const MainBooksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Recommended",
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
