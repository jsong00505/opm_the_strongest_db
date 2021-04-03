import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/ui/home_page_body.dart';
import 'file:///C:/dev/workspace/FlutterProject/OpmTheStrongestDb/opm_the_strongest_db/lib/ui/settings/settings_page.dart';
import 'package:opm_the_strongest_db/common/text_style.dart';

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

    final searchButton = IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.search,
      ),
    );

    final moreButton = IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.more_vert,
      ),
    );

    final drawerHeader = UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('repo/images/developers/jun_profile.png'),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundImage:
              AssetImage('repo/images/logos/circle_linkedin_logo.png'),
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          backgroundImage:
              AssetImage('repo/images/logos/circle_github_logo.png'),
          backgroundColor: Colors.white,
        )
      ],
      accountName: Text('jsong00505', style: Style.headerTextStyle),
      accountEmail:
          Text('jsong00505@gmail.com', style: Style.subHeaderTextStyle),
    );

    return Scaffold(
        backgroundColor: Colors.deepPurple[400],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'OPM: The Strongest'.tr(),
            style: Style.appBarTextStyle,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Color(0xFF3366FF), Color(0xFF00CCFF)])),
          ),
          //leading: menuButton,
          actions: [
            searchButton,
            moreButton,
          ],
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            drawerHeader,
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
              //trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.description,
                color: Colors.grey[850],
              ),
              title: Text('Characters'),
              onTap: () {
                print('Characters is clicked');
              },
              //trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Settings'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsPage())),
              //trailing: Icon(Icons.add),
            )
          ],
        )),
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
