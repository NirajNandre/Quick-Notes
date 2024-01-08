import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size, Color color, FontWeight fw){
  return GoogleFonts.poppins(fontSize:  size, color: color, fontWeight: fw );
}

TextStyle appstylewithHeight(double size, Color color, FontWeight fw, double ht){
  return GoogleFonts.poppins(fontSize:  size, color: color, fontWeight: fw, height: ht );
}


class Constants{
  final primaryColor = Color.fromARGB(255, 40, 40, 75);
  final secondaryColor = Color.fromARGB(255, 247, 248, 250);
}