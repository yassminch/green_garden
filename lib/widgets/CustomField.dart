import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String? Function(String?)? valider;
  final String label;
  final String hint;
  final IconData? iconDATA;
  final TextInputType? typeInput;
  final void Function(String?)? saved;

  const CustomField({
    super.key,
    this.label = "",
    this.hint = "",
    this.iconDATA,
    this.typeInput,
    this.valider,
    this.saved,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: typeInput,
        style: TextStyle(
          color: Color.fromARGB(223, 40, 77, 51),
        ),
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyle(
            color: Color.fromARGB(223, 0, 179, 54),
            fontSize: 18,
            letterSpacing: 0.5,
            
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Color.fromARGB(224, 126, 201, 149)),
          prefixIcon: Icon(iconDATA),
          prefixIconColor: Color.fromARGB(223, 49, 88, 61),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(224, 126, 201, 149)),
              borderRadius: BorderRadius.circular(10)),
               focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(224, 126, 201, 149)),
    ),
        ),
        validator: valider,
        onSaved: saved,
      ),
    );
  }
}
