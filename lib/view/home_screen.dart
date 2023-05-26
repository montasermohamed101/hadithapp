import 'package:flutter/material.dart';
import 'package:hadithapp/provider/settings_provider.dart';
import 'package:hadithapp/utils/app_color.dart';
import 'package:hadithapp/view/tabs/ahadith/ahadith_screen.dart';
import 'package:hadithapp/view/tabs/quarn/quran_screen.dart';
import 'package:hadithapp/view/tabs/radio/radio_screen.dart';
import 'package:hadithapp/view/tabs/sebha/sebha_screen.dart';
import 'package:hadithapp/view/tabs/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeHome = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  List<Widget> tab = [
    QuranScreen(),
    AhadithScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image:  AssetImage(provider.currentTheme == ThemeMode.light ?
            'assets/home_bg.png' : 'assets/home_bg_dark.png',
          ),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami
            ),
        ),
        body: tab[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int tappedTab){
            currentIndex = tappedTab;
            setState(() {

            });
          } ,
          items:  [
            const BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/ic_quran.png'),
              ),
              label: 'Quran',
            ),
            const BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/ic_ahadith.png'),
              ),
              label: 'Ahadith',
            ),
            const BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/ic_sebha.png'),
            ), label: 'Sebha',

            ),
            const BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/ic_radio.png'),
            ), label: 'Radio',
            ),
            BottomNavigationBarItem(icon:const Icon(Icons.settings,
            ), label:   AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
