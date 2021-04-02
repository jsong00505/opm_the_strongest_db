import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/ui/homePage.dart';
import 'package:opm_the_strongest_db/ui/details/detailPage.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en', 'US'), Locale('ko', 'KR')],
    path: 'repo/translations',
    fallbackLocale: Locale('en', 'US'),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'OPM: The Strongest'.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'OPM: The Strongest'.tr()),
      /*routes: <String, WidgetBuilder>{
        '/detail': (_) => DetailPage(null),
      },*/
    );
  }
}
