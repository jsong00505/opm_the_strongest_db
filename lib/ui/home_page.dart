import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/common/text_style.dart';
import 'package:opm_the_strongest_db/common/opm_app_bar.dart';
import 'package:opm_the_strongest_db/common/opm_drawer.dart';
import 'package:opm_the_strongest_db/ui/characters/character_page.dart';
import 'package:opm_the_strongest_db/models/opm_character_item.dart';
import 'package:opm_the_strongest_db/db/character_generator.dart';

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
    final buttonContent = Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 27.0),
            Text(
              'Characters',
              style: Style.headerTextStyle,
            ),
          ],
        ));

    final button = Container(
      child: buttonContent,
      height: 80.0,
      margin: EdgeInsets.only(left: 46.0, right: 46.0),
      decoration: BoxDecoration(
          color: Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ]),
    );

    return Scaffold(
        backgroundColor: Colors.deepPurple[400],
        appBar: OpmAppBar().build(context),
        drawer: OpmDrawer().build(context),
        body: GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CharacterPage())),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
              child: Stack(
                children: <Widget>[button],
              ),
            )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
