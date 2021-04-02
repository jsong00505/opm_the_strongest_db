import 'package:flutter/material.dart';

import '../opmCharacterItem.dart';
import './secondPage.dart';

class FirstApp extends StatelessWidget {
  final List<OpmCharacter> list; // List 선언
  FirstApp({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, position) {
                return GestureDetector(
                  child: Card(
                    child: Wrap(
                      children: <Widget>[
                        Image.asset(
                          list[position].imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Text('${list[position].name}')),
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Text('${list[position].rarity}')),
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Text('${list[position].faction}'))
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SecondApp(opmCharacter: list[position])));
                    /*AlertDialog dialog = AlertDialog(
                      content: Text(
                        '${list[position].name}은(는) ${list[position].type} 타입 입니다',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => dialog);*/
                  },
                );
              },
              itemCount: list.length),
        ),
      ),
    );
  }
}
