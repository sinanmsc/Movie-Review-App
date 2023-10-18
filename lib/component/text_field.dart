import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:movieapp/Responsive/responsive.dart';

class CustomeTextfield extends StatelessWidget {
  final Icon? icon;
  final String label;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  CustomeTextfield({
    super.key,
    required this.label,
    this.icon,
    this.onChanged,
    this.controller,
  });

  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: icon,
        filled: true,
        fillColor: Colors.black,
        label: Text('\t\t$label'),
        enabledBorder: GradientOutlineInputBorder(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF31bbc5),
              Color.fromARGB(255, 49, 108, 197),
            ],
          ),
          width: Responsive.width(3, context),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: GradientOutlineInputBorder(
          gradient: const LinearGradient(
            colors: [Color(0xFF31bbc5), Color.fromARGB(255, 49, 108, 197)],
          ),
          width: Responsive.width(3, context),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
