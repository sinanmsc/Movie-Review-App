import 'package:flutter/material.dart';

import '../Responsive/responsive.dart';

// ignore: must_be_immutable
class Signbutton extends StatelessWidget {
  String label;
  Signbutton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: Responsive.height(70, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Responsive.width(20, context),
        ),
        gradient: const LinearGradient(
          colors: [Color(0xFF31bbc5), Color.fromARGB(255, 49, 108, 197)],
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
            fontSize: Responsive.width(20, context),
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
