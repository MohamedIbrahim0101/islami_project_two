import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_prj/ui/model/sura.dart';
import 'package:islami_prj/ui/utils/app_assets.dart';
import 'package:islami_prj/ui/utils/app_colors.dart';
import 'package:islami_prj/ui/utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  final Sura sura;

  SuraDetails({super.key, required this.sura});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String fileContent = "";

  @override
  void initState() {
    super.initState();
    readSuraFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.suraDetailsBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          leading: BackButton(color: AppColors.gold),
          title: Text(widget.sura.nameEn, style: AppStyles.gold20Bold),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.leftCornerBG),
                Expanded(
                  child: Text(
                    widget.sura.nameAr,
                    textAlign: TextAlign.center,
                    style: AppStyles.gold20Bold,
                  ),
                ),
                Image.asset(AppAssets.rightCornerBG),
              ],
            ),
            fileContent.isEmpty ? CircularProgressIndicator(
              color: AppColors.gold,) : Expanded(
              child: SingleChildScrollView(
                child: Text(
                  fileContent,
                  textAlign: TextAlign.center,
                  style: AppStyles.gold20Bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> readSuraFile() async {
    fileContent = await rootBundle.loadString(
      "assets/files/${widget.sura.quranIndex}.txt",
    );
    List<String> fileLines = fileContent.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] = fileLines[i].trim();
      fileLines[i] += " {${i + 1}} ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
