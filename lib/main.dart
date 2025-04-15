import 'package:flutter/material.dart';
import 'package:islami_prj/ui/model/sura.dart';
import 'package:islami_prj/ui/screens/home/home.dart';
import 'package:islami_prj/ui/screens/splash/splash.dart';
import 'package:islami_prj/ui/utils/constants.dart';

void main() {
  for (int i = 0; i < Constants.arabicQuranSuras.length; i++) {
    Constants.suras.add(
      Sura(
        nameEn: Constants.englishQuranSuras[i],
        nameAr: Constants.arabicQuranSuras[i],
        verses: Constants.surasVerses[i],
        quranIndex: i + 1,
      ),
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // theme: ThemeData(
      //   canvasColor: Colors.black,
      //
      // ),
    );
  }
}
