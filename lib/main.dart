import 'package:factinator/extensions/extensions.dart';
import 'package:factinator/pages/welcome_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
  });

  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factinator',
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      theme: ThemeData(
          primarySwatch: const Color(0xff153462).toMaterialColor(),
          textTheme: GoogleFonts.ralewayTextTheme()),
    );
  }
}
