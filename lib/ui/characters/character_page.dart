import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/common/opm_app_bar.dart';
import 'package:opm_the_strongest_db/common/opm_drawer.dart';
import 'package:opm_the_strongest_db/ui/home_page_body.dart';
import 'package:opm_the_strongest_db/models/opm_character_item.dart';
import 'package:opm_the_strongest_db/db/character_generator.dart';

class CharacterPage extends StatefulWidget {
  CharacterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage>
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
        appBar: OpmAppBar().build(context),
        drawer: OpmDrawer().build(context),
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
