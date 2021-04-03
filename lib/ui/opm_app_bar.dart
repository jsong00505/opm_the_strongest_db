import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/common/text_style.dart';

class OpmAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final searchButton = IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.search,
      ),
    );

    final moreButton = IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.more_vert,
      ),
    );

    return AppBar(
      centerTitle: true,
      title: Text(
        'OPM: The Strongest'.tr(),
        style: Style.appBarTextStyle,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[Color(0xFF3366FF), Color(0xFF00CCFF)])),
      ),
      //leading: menuButton,
      actions: [
        searchButton,
        moreButton,
      ],
    );
  }

}