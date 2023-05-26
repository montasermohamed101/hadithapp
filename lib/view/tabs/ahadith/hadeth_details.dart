import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hadithapp/model/hadeth.dart';
import 'package:hadithapp/model/surah_details_args.dart';
import 'package:hadithapp/utils/app_color.dart';

class HadethDetails extends StatelessWidget {

static String routeName = 'hadeth details';

@override
Widget build(BuildContext context) {
  var hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/home_bg.png',
            ),
            fit: BoxFit.fill)),
    child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            hadeth.title,
            style: TextStyle(
              color: AppColors.accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        // body: Text('${readSuraContent('${suraContent}')}'),
        body: SingleChildScrollView(
          child: Text(
            '${hadeth.content}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
    ),
  );
}

}
