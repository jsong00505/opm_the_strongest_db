import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/models/opm_character_item.dart';
import 'package:opm_the_strongest_db/common/text_style.dart';
import 'package:opm_the_strongest_db/ui/details/detail_page.dart';
import 'package:easy_localization/easy_localization.dart';

class CharacterRow extends StatelessWidget {
  final OpmCharacter opmCharacter;

  CharacterRow(this.opmCharacter);

  @override
  Widget build(BuildContext context) {
    final characterThumbnail = Container(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        alignment: FractionalOffset.centerLeft,
        child: Image(
          image: AssetImage(opmCharacter.imagePath),
          width: 92.0,
          height: 92.0,
        ));

    final characterCardContent = Container(
        margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 4.0),
            Text(
              opmCharacter.name.tr(),
              style: Style.headerTextStyle,
            ),
            Container(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    opmCharacter.rarity,
                    style: Style.subHeaderTextStyle,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Color(0xff00c6ff),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child:
                        _characterValue(value: opmCharacter.type.tr(), image: '')),
                Expanded(
                    child: _characterValue(
                        value: opmCharacter.faction.tr(), image: '')),
              ],
            ),
          ],
        ));

    final chracterCard = Container(
      child: characterCardContent,
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
          color: Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ]),
    );

    return GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailPage(opmCharacter))),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: <Widget>[chracterCard, characterThumbnail],
          ),
        ));
  }

  Widget _characterValue({String value, String image}) {
    return Row(
      children: <Widget>[
        //Image.asset(image, height: 16.0),
        Container(width: 8.0),
        Text(value, style: Style.regularTextStyle),
      ],
    );
  }
}
