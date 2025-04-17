import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/core/routing/router.dart';
import 'package:flutter_pixabay_image_search_app/core/ui/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: ColorStyle.white,
      ),
      routerConfig: router,
    );
  }
}
