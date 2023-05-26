import 'package:flutter/material.dart';
import 'package:hadithapp/provider/settings_provider.dart';
import 'package:hadithapp/utils/app_color.dart';
import 'package:hadithapp/view/tabs/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return  Padding(
      padding:  EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall,
          ),
           const SizedBox(height: 22,),
          InkWell(
            onTap: (){
              onLanguageRowClick(context);
            },
              child: getRowOption(provider.currentLocale == "en" ? 'English' :'العربية',context)),

          const SizedBox(height: 22,),
          // Row(
          //   children: [
          //     Text('Dark Mode',textAlign: TextAlign.start,
          //       style: Theme.of(context).textTheme.titleSmall,
          //
          //     ),
          //     Spacer(),
          //     // Switch(value: provider.switchValue,
          //     //     onChanged: (newSwitchValue){
          //     //   provider.switchValue = newSwitchValue;
          //     //   if(provider.switchValue){
          //     //     provider.changeCurrentTheme(ThemeMode.dark);
          //     //   }else{
          //     //     provider.changeCurrentTheme(ThemeMode.light);
          //     //
          //     //   }
          //     //     }),
          //
          //   ],
          // ),
          InkWell(
            onTap: (){
              onThemeRowClick(context);
            },
            child: getRowOption(provider.currentLocale == "en" ? "Theme Mode" :"وضع السمة",context),
          ),
          const SizedBox(height: 22,),

        ],
      ),
    );
  }
  Widget getRowOption(String selectedOption,context){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1,color: AppColors.primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedOption,style:Theme.of(context).textTheme.titleMedium, ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
  onThemeRowClick(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
   onLanguageRowClick(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder:(context){
        return LanguageBottomSheet();
        }
    );
  }
}
