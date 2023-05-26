import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hadithapp/model/surah_details_args.dart';

import '../../../utils/app_color.dart';
import 'sura_details_screen.dart';

class QuranScreen extends StatelessWidget {
  List<String> surahNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(
          flex: 35,
          child: Image.asset('assets/quran_tab_logo.png'),
        ),
        Divider(
          height: 3,
          color: AppColors.primaryColor,
          thickness: 3,
        ),
        Text(
          'Sura Name',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Divider(
          height: 3,
          color: AppColors.primaryColor,
          thickness: 3,
        ),
        Expanded(
            flex: 65,
            child: ListView.separated(
              itemBuilder: (context, index) =>buildSuraNameItem(context,index),
            separatorBuilder: (context, index) =>
                Divider(
                  height: 5,
                  color: AppColors.primaryColor,
                  thickness: 2,
                ),
            itemCount: surahNames.length)),

    ]
    ,
    )
    ,
    );
  }

  Widget buildSuraNameItem(BuildContext context,int index) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailsScreen.surahDetails,
              arguments: SuraDetailsArgs(
              fileName:"${index+1}.txt", suraName: surahNames[index]));
        },
        child: Text(surahNames[index],textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ));
  }
}
