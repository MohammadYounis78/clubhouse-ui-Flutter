import 'package:culbhouse/constants.dart';
import 'package:culbhouse/secreens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloub House',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
           appBarTheme: const AppBarTheme(
            backgroundColor: kBackgroundColor),
            scaffoldBackgroundColor: kBackgroundColor ,
            primaryColor: Colors.white,
           colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: kHintColor),// Your accent color
         iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily ,
        textTheme: GoogleFonts.montagaTextTheme(),
     ),


 home: homeScreen(),
    );
  }
}
