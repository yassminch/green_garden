import 'package:flutter/material.dart';

import '../pages/result.dart';

class PlantsName extends StatelessWidget {
  final String Name;
  final Color? color;
  final double size;
  final void Function()? ontap;
  const PlantsName({super.key, required this.Name, this.color, this.ontap, required this.size});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(Name,
          style: TextStyle(
            fontSize: size,
            fontFamily: 'Parisienne',
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
            color:  color,
          )),
      
    );
  }
}
