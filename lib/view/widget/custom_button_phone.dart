import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonPhone extends StatelessWidget {
  const CustomButtonPhone(
      {super.key,
      required this.height,
      required this.width,
      required this.buttonname,
      required this.onPressed});

  final double height;
  final double width;
  final String buttonname;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 0, 72, 131)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)))),
          child: Text(buttonname,
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white)),
        ));
  }
}
