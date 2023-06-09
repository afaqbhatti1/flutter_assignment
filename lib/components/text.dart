import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget TextWidget(String text, Color color, double fontsize) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        color: color, fontSize: fontsize, fontWeight: FontWeight.w500),
  );
}
