import 'package:flutter/material.dart';
import 'package:sau_mukratha_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    SauMukrathaApp(),
  );
}

class SauMukrathaApp extends StatefulWidget {
  const SauMukrathaApp({super.key});

  @override
  State<SauMukrathaApp> createState() => _SauMukrathaAppState();
}

class _SauMukrathaAppState extends State<SauMukrathaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
