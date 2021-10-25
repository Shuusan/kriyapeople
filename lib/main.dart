import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';
import 'views/_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(KriyaApp());
}

class KriyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kryia People',
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColors),
              headline2: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColors),
              headline3: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColors),
              bodyText1: GoogleFonts.openSans(fontSize: 16, color: blackColors),
              bodyText2: GoogleFonts.montserrat(fontSize: 12, color: greyish))),
      home: Page1(),
    );
  }
}
