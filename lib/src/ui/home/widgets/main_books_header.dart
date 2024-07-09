import 'package:cme_flutter_assessment/resources/strings.dart';
import 'package:flutter/material.dart';

class MainBooksHeader extends StatelessWidget {
  const MainBooksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Strings.recommended,
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
