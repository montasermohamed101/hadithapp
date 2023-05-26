import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../provider/settings_provider.dart';
import '../../../utils/app_color.dart';

class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return  Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Select your Mode',
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
                provider.changeCurrentTheme(ThemeMode.light);
                Navigator.pop(context);
              },
                child: getThemeRow(provider.currentTheme == ThemeMode.light,'Light')),
            const SizedBox(height: 16,),
            InkWell(
                onTap: (){
                  provider.changeCurrentTheme(ThemeMode.dark);

                  Navigator.pop(context);
                },
                child: getThemeRow(provider.currentTheme == ThemeMode.dark,'Dark')),
          ],
        ),
      ),
    );
  }

  Widget getThemeRow(bool isSelectedTheme,String text){
    if(isSelectedTheme){
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
