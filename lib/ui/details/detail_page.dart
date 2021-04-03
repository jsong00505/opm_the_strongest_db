import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/models/opm_character_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:opm_the_strongest_db/common/text_style.dart';

class DetailPage extends StatelessWidget {
  OpmCharacter opmCharacter;

  DetailPage(this.opmCharacter);

  @override
  Widget build(BuildContext context) {
    final characterThumbnail = Container(
        margin: EdgeInsets.only(top: 90, left: 46.0, right: 46.0),
        alignment: FractionalOffset.topCenter,
        child: Image(
          image: AssetImage(opmCharacter.imagePath),
          width: 92.0,
          height: 92.0,
        ));

    final characterCardContent = Container(
        //margin: EdgeInsets.fromLTRB(40.0, 16.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 60.0),
            Text(
              opmCharacter.name.tr(),
              style: Style.headerTextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Color(0xff00c6ff),
            ),
            Text(
              opmCharacter.rarity,
              style: Style.subHeaderTextStyle,
            ),
            Container(
              height: 4.0,
              width: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  opmCharacter.roles.tr(),
                  style: Style.regularTextStyle,
                )
              ],
            ),
            Container(
              height: 4.0,
              width: 18.0,
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

    final characterCard = Container(
      child: characterCardContent,
      height: 170.0,
      margin: EdgeInsets.only(top: 140, left: 46.0, right: 46.0),
      alignment: FractionalOffset.center,
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

    final backgroundTopImage = Container(
      child: Image.asset(opmCharacter.imagePath,
          fit: BoxFit.cover,
          height: 300.0,
          color: Color.fromRGBO(255, 255, 255, 1.0),
          colorBlendMode: BlendMode.modulate),
      constraints: BoxConstraints.expand(height: 300.0),
    );

    final borderGradation = Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );

    Map<String, Widget> skillDescriptionsByType = {
      'attack': Center(),
      'ultimate': Center(),
      'passive': Center(),
      'core': Center(),
      'ultra_ultimate': Center(),
      'ultra_passive': Center()
    };
    opmCharacter.skills.forEach((element) {
      var description = Container(
          margin: EdgeInsets.only(top: 10),
          child: RichText(
              text: TextSpan(style: Style.subHeaderTextStyle, children: [
            TextSpan(text: element.name.tr(), style: Style.subHeaderTextBoldStyle),
            TextSpan(
              text: ' [ ${element.type.tr()} ]',
              style: Style.subHeaderTextBoldStyle,
            ),
            TextSpan(text: ' : ' + element.description[0].tr()),
          ])));
      skillDescriptionsByType[element.type] = description;
    });

    final skills = SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: 800,
          ),
          Positioned(
            top: 330,
            left: 46,
            right: 46,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Text('Skills'.tr(), style: Style.headerTextStyle)),
                  Container(
                    height: 2.0,
                    width: 18.0,
                    color: Color(0xff00c6ff),
                  ),
                  skillDescriptionsByType['attack'],
                  skillDescriptionsByType['ultimate'],
                  skillDescriptionsByType['ultra_ultimate'],
                  skillDescriptionsByType['passive'],
                  skillDescriptionsByType['ultra_passive'],
                ]),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OPM: The Strongest'.tr(),
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: <Color>[Color(0xFF3366FF), Color(0xFF00CCFF)])),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            skills,
            backgroundTopImage,
            borderGradation,
            characterCard,
            characterThumbnail,
          ],
        ),
      ),
    );
  }

  Widget _characterValue({String value, String image}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Image.asset(image, height: 12.0),
        Container(width: 8.0),
        Text(value, style: Style.regularTextStyle),
      ],
    );
  }
}
