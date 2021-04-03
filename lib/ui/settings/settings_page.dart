import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/ui/settings/language_config_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> settings = ["Language"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, position) {
                return GestureDetector(
                  child: Card(
                    child: Wrap(
                      children: <Widget>[
                        Image.asset(
                          'repo/images/icons/globe.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Text('${settings[position]}')),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LanguageConfigPage())),
                );
              },
              itemCount: settings.length),
        ),
      ),
    );
  }
}
