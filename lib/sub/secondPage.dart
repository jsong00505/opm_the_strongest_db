import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../opmCharacterItem.dart';

class SecondApp extends StatelessWidget{
  OpmCharacter opmCharacter;
  SecondApp({Key key, this.opmCharacter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('${opmCharacter.name}: ${opmCharacter.skills[0].name}'),
        ),
      ),
    );
  }
}