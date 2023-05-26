import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hadithapp/model/surah_details_args.dart';
import 'package:hadithapp/utils/app_color.dart';

class DetailsScreen extends StatefulWidget {
  static String surahDetails = 'sura details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> suraLines = [];


  readSuraContent(String filename) async {
    var suraContent = await rootBundle.loadString('assets/files/$filename');
    suraLines = suraContent.trim().split('\n');
    setState(() {});
    print('read file');
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraLines.isEmpty) {
      readSuraContent(args.fileName);
    }
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
              args.suraName,
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
          body: suraLines.isEmpty
              ? CircularProgressIndicator()
              : ListView.separated(
                  itemBuilder: (context, index) => Text(
                  '(${index + 1}) ${suraLines[index]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    thickness: 2,
                    color: AppColors.primaryColor,
                  ),
                  itemCount: suraLines.length,
                )),
    );
  }
}
