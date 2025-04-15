import 'package:flutter/material.dart';
import 'package:islami_prj/ui/model/sura.dart';
import 'package:islami_prj/ui/utils/app_assets.dart';
import 'package:islami_prj/ui/utils/app_colors.dart';
import 'package:islami_prj/ui/utils/app_routes.dart';
import 'package:islami_prj/ui/utils/app_styles.dart';
import 'package:islami_prj/ui/utils/constants.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<Sura> filteredSurasList = Constants.suras;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiLogo),
          buildSearchTextField(),
          SizedBox(height: 10),
          Text("Suras List", style: AppStyles.white16Bold),
          buildSurasListView(),
        ],
      ),
    );
  }

  buildSearchTextField() {
    var border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 1),
    );
    return TextField(
      decoration: InputDecoration(
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icQuran),
          color: AppColors.gold,
        ),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        labelText: "Sura name",
        labelStyle: AppStyles.white14Bold,
      ),
      onChanged: (query) {
        setState(() {
          filteredSurasList = Constants.suras.where((sura) {
            return sura.nameAr.contains(query) ||
                sura.nameEn.toLowerCase().contains(query.toLowerCase());
          }).toList();
        });
      },
      cursorColor: AppColors.white,
      style: AppStyles.white16Bold,
    );
  }

  Widget buildSurasListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: filteredSurasList.length,
        itemBuilder: (context, index) => buildSuraRow(context, index),
        separatorBuilder: (__, _) => Divider(thickness: 2,),
      ),
    );
  }

  Widget buildSuraRow(BuildContext context, int index) {
    var sura = filteredSurasList[index];
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRoutes.suraDetails(sura));
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.numbersBackground),
              Text("${sura.quranIndex}", style: AppStyles.white14Bold,)
            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.nameEn, style: AppStyles.white16Bold,),
                SizedBox(height: 4,),
                Text("${sura.verses} verses", style: AppStyles.white14Bold,)
              ],
            ),
          ),
          Text(sura.nameAr, style: AppStyles.white16Bold,)
        ],
      ),
    );
  }
}
