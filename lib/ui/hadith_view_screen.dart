import 'package:flutter/material.dart';
import 'package:islami_prj/ui/model/hadith_model.dart';
import 'package:islami_prj/ui/utils/app_assets.dart';
import 'package:islami_prj/ui/utils/app_colors.dart';

class HadithViewScreen extends StatelessWidget {
  final HadithModel hadith;

  const HadithViewScreen({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية سوداء
      body: SafeArea(
        child: Column(
          children: [
            // Header Section (رجوع + عنوان انجليزي)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.gold),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    'Hadith ${hadith.title.replaceAll(RegExp(r'[^0-9]'), '')}',
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // الزخارف + عنوان الحديث بالعربي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.leftCornerBG,
                  width: 93,
                  height: 92,
                  color: AppColors.gold,
                ),
                Text(
                  hadith.title,
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  AppAssets.rightCornerBG,
                  width: 93,
                  height: 92,
                  color: AppColors.gold,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // محتوى الحديث
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    hadith.content.join('\n'),
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            // صورة المسجد
            Image.asset(
              'assets/images/Mosque-02 2.png',
              color: AppColors.gold,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
