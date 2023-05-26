import 'package:flutter/material.dart';
import 'package:hadithapp/provider/settings_provider.dart';
import 'package:hadithapp/utils/app_color.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return  Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Select your Language',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,

            ),
            ),
            const SizedBox(height: 22,),
            Divider(color: AppColors.primaryColor,height: 3,thickness: 3),
            const SizedBox(height: 16,),
            InkWell(
              onTap: (){
                provider.changeCurrentLocale('en');
                Navigator.pop(context);
              },
                child: getLanguageRow(provider.currentLocale == "en",'English')),
            const SizedBox(height: 16,),
            InkWell(
                onTap: (){
                  provider.changeCurrentLocale('ar');
                  Navigator.pop(context);
                },
                child: getLanguageRow(provider.currentLocale == "ar",'العربية')),
          ],
        ),
      ),
    );
  }

  Widget getLanguageRow(bool isSelected,String text){
    if(isSelected){
      return Text(
        text,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      );
    }else{
      return Text(
        text,
        style: TextStyle(
          color: AppColors.accentColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),

      );
    }
  }
}
