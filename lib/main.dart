import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'opmCharacterItem.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import 'db/characterGenerator.dart';

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
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<OpmCharacter> opmCharacterList;
  CharacterGenerator characterGenerator;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    characterGenerator = CharacterGenerator();
    opmCharacterList = characterGenerator.generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OPM: The Strongest').tr(),
        ),
        body: TabBarView(
          children: <Widget>[FirstApp(list: opmCharacterList), SecondApp()],
          controller: controller,
        ),
        bottomNavigationBar: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.looks_one, color: Colors.blue),
            ),
            Tab(
              icon: Icon(Icons.looks_two, color: Colors.blue),
            )
          ],
          controller: controller,
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
