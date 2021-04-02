import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/ui/homePageBody.dart';

import '../opmCharacterItem.dart';
import '../db/characterGenerator.dart';

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
        backgroundColor: Colors.deepPurple[400],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'OPM: The Strongest'.tr(),
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Color(0xFF3366FF), Color(0xFF00CCFF)])),
          ),
        ),
        //body: FirstApp(list: opmCharacterList));
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomePageBody(opmCharacterList),
          ],
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
