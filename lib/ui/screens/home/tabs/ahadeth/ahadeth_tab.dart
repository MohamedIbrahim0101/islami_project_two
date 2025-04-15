import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_prj/ui/model/hadith_model.dart';
import 'package:islami_prj/ui/utils/app_assets.dart';
import 'package:islami_prj/ui/utils/app_colors.dart';
import 'package:islami_prj/ui/utils/app_styles.dart';
import '../../../../hadith_view_screen.dart';
import 'hadith_view_screen.dart'; // تأكد من مسار الاستيراد

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadithModel> hadithlist = [];

  @override
  void initState() {
    super.initState();
    loadHadith();
  }

  void loadHadith() async {
    for (int i = 1; i <= 50; i++) {
      String hadithcontent = await rootBundle.loadString(
          'assets/ahadith/drive-download-20250413T094645Z-001/h$i.txt');
      List<String> lines = hadithcontent.trim().split('\n');
      String title = lines[0];
      List<String> content = lines.sublist(1);
      hadithlist.add(HadithModel(title, content));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.ahadethBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AppAssets.islamiLogo),
          Expanded(
            child: hadithlist.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Container(
              margin: const EdgeInsets.all(20),
              child: CarouselSlider.builder(
                itemCount: hadithlist.length,
                itemBuilder: (context, index, pageViewIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HadithViewScreen(
                            hadith: hadithlist[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/HadithCardBackGround 1.png'),
                          fit: BoxFit.fill,
                        ),
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          // Title Row
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppAssets.leftCornerBG,
                                color: Colors.black,
                              ),
                              Text(
                                hadithlist[index].title,
                                style: AppStyles.black24Bold,
                              ),
                              Image.asset(
                                AppAssets.rightCornerBG,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Hadith Content
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                hadithlist[index].content.join('\n'),
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          // Bottom Mosque Image
                          Image.asset(
                            'assets/images/Mosque-02 2.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
