import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/ui/characterRow.dart';
import 'package:opm_the_strongest_db/opmCharacterItem.dart';

class HomePageBody extends StatelessWidget {
  final List<OpmCharacter> opmCharacter;

  HomePageBody(this.opmCharacter);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: Color(0xFF736AB7),
            child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    sliver: SliverFixedExtentList(
                      itemExtent: 152.0,
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => CharacterRow(opmCharacter[index]),
                        childCount: opmCharacter.length,
                      ),
                    ),
                  )
                ])));
  }
}
