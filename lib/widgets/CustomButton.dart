import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String nom;
  final void Function()? role;

  const CustomButton({
    super.key,
    this.nom = " ",
    this.role
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: role,
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.only(top: 12.0, bottom: 12.0, right: 35.0, left: 35.0),
            ),
            backgroundColor: MaterialStatePropertyAll<Color>(
                Color.fromARGB(224, 126, 201, 149)),
            overlayColor: MaterialStatePropertyAll<Color>(
                Color.fromARGB(209, 175, 219, 189)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28))))),
        child: Text(nom,
            style: TextStyle(
              fontSize: 23,
              fontFamily: 'Parisienne',
            )),
      ),
    );
  }
}
