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
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          list[position].imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(
                            '${list[position].name} (${list[position].rarity})'),
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
                  onLongPress: () {
                    list.removeAt(position);
                  },
                );
              },
              itemCount: list.length),
        ),
      ),
    );
  }
}