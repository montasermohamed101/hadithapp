import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hadithapp/provider/settings_provider.dart';
import 'package:hadithapp/utils/app_theme.dart';
import 'package:hadithapp/view/home_screen.dart';
import 'package:hadithapp/view/tabs/ahadith/hadeth_details.dart';
import 'package:hadithapp/view/tabs/quarn/sura_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider(),
          ),
          // other providers
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  late  SettingsProvider provider;
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<SettingsProvider>(context);
     initSharedPref();
    return MaterialApp(
      themeMode:provider.currentTheme,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.currentLocale),
      routes: {
      HomeScreen.routeHome:(_) => HomeScreen(),
      DetailsScreen.surahDetails:(_) => DetailsScreen(),
      HadethDetails.routeName:(_) => HadethDetails(),
     },
      initialRoute: HomeScreen.routeHome,
    );
  }
  void initSharedPref()async{
    final  prefs = await SharedPreferences.getInstance();
     String lang =  prefs.getString('lang') ?? 'en';
     String theme =  prefs.getString('theme') ?? 'light';
     provider.changeCurrentLocale(lang);
     provider.changeCurrentTheme(theme == 'light'? ThemeMode.light : ThemeMode.dark );
  }
}

/*
{
"islami":"اسلامى",
"settings":"الاعدادات",
"language":"اللغه",
"mode":"النمط",
"light":"مضئ",
"dark":"غامق",

}

{
"islami":"Islami",
"settings":"Settings",
"language":"Language",
"mode":"Mode",
"light":"Light",
"dark":"Dark",

}
 */