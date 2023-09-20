import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controlador,
      required this.label,
      this.minLines,
      this.maxLines});
  final TextEditingController controlador;
  final String label;
  final int? minLines, maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo obrigatório";
        }
        return null;
      },
      minLines: minLines,
      maxLines: maxLines,
      controller: controlador,
      decoration: InputDecoration(
        label: Text(label),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 105, 69, 185),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 105, 69, 185),
          ),
        ),
      ),
    );
  }
}
