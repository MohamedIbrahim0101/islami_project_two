import 'package:flutter/material.dart';
import 'package:islami_prj/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_prj/ui/screens/home/tabs/pray_times/pray_times_tab.dart';
import 'package:islami_prj/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_prj/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_prj/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_prj/ui/utils/app_assets.dart';
import 'package:islami_prj/ui/utils/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = const [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    PrayTimesTab()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: tabs[currentIndex],
          bottomNavigationBar: buildBottomNavigationBar()
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.gold),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icQuran)),
            label: "quran",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
            label: "ahadeth",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icSebha)),
            label: "sebha",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icRadio)),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icPrayTimes)),
            label: "Time",
          ),
        ],
      ),
    );
  }
}

