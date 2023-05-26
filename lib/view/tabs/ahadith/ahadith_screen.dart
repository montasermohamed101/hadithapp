import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hadithapp/model/hadeth.dart';
import 'package:hadithapp/model/surah_details_args.dart';

import '../../../model/hadeth.dart';
import '../../../utils/app_color.dart';
import '../quarn/sura_details_screen.dart';
import 'hadeth_details.dart';

class AhadithScreen extends StatefulWidget {

  @override
  State<AhadithScreen> createState() => _AhadithScreenState();
}

class _AhadithScreenState extends State<AhadithScreen> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
  if(ahadethList.isEmpty){
    readAhadethFile();
  }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 35,
            child: Image.asset('assets/ahadith_tab_logo.png'),
          ),
          Divider(
            height: 3,
            color: AppColors.primaryColor,
            thickness: 3,
          ),
          Text(
            'Ahadeth',
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
                  itemBuilder: (context, index) => buildHadethItem(context,index),
                  separatorBuilder: (context, index) =>
                      Divider(
                        height: 5,
                        color: AppColors.primaryColor,
                        thickness: 2,
                      ),
                  itemCount: ahadethList.length)),

        ]
        ,
      )
      ,
    );
  }
  readAhadethFile()async{
    String hadethFile = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadeth = hadethFile.split('#');

    for(int i = 0; i < ahadeth.length; i++) {
      List<String> singleHadethLines = ahadeth[i].trim().split("\n");
      String title = singleHadethLines.removeAt(0);
      // ahadethList.add(title);
      String content = singleHadethLines.join("\n");
      // ahadethList.add(content);
      ahadethList.add(Hadeth(title: title, content: content));
    }
    setState(() {});

  }

  Widget buildHadethItem(BuildContext context,int index) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, HadethDetails.routeName,
           arguments:ahadethList[index]);
        },
        child: Text(ahadethList[index].title,textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,));
  }

}
