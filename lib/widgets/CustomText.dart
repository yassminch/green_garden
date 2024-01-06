import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String stringvalue;
  const CustomText({super.key, required this.stringvalue});

  @override
  Widget build(BuildContext context) {
    return Text(
      // synonyme names of the plant
      stringvalue,
      style: TextStyle(
        fontFamily: 'Parisienne',
        color: Color.fromARGB(224, 125, 189, 145),
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        fontSize: 20,
      ),
    );
  }
}
