import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/common/text_style.dart';
import 'file:///C:/dev/workspace/FlutterProject/OpmTheStrongestDb/opm_the_strongest_db/lib/ui/settings/settings_page.dart';

class OpmDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return Drawer(
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
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SettingsPage())),
          //trailing: Icon(Icons.add),
        )
      ],
    ));
  }
}
