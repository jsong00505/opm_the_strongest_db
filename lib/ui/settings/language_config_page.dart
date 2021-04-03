import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map locales = {
      "English": ["en", "US"],
      "Korean": ["ko", "KR"]
    };

    print(context.locale.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, position) {
                String key = locales.keys.elementAt(position);
                return GestureDetector(
                  child: Card(
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(key.tr())),
                      ],
                    ),
                  ),
                  onTap: () {
                    _changeLocale(context, locales[key]);
                  },
                );
              },
              itemCount: locales.length),
        ),
      ),
    );
  }

  void _changeLocale(BuildContext context, List<String> localeCodes) {
    context.locale = Locale(localeCodes[0], localeCodes[1]);
  }
}
