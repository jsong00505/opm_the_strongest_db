import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../opmCharacterItem.dart';

class SecondApp extends StatelessWidget {
  OpmCharacter opmCharacter;

  SecondApp({Key key, this.opmCharacter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OPM: The Strongest').tr(),
        ),
        body: Container(
            child: Center(
                child: Wrap(children: <Widget>[
          Image.asset(
            opmCharacter.imagePath,
            fit: BoxFit.contain,
          ),
          Table(
            border: TableBorder.all(),
            children: <TableRow>[
              TableRow(children: <Widget>[
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Name'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('${opmCharacter.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ]),
              TableRow(children: <Widget>[
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Type'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('${opmCharacter.type}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ]),
              TableRow(children: <Widget>[
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Faction'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('${opmCharacter.faction}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ]),
              TableRow(children: <Widget>[
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Rarity'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text('${opmCharacter.rarity}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ])
            ],
          ),
          Table(border: TableBorder.all(), children: <TableRow>[
            TableRow(children: <Widget>[
              TableCell(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text('Skill'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              )
            ])
          ]),
        ]))));
  }

  List<Widget> _getSkillList(List<Skill> skills) {}
}
