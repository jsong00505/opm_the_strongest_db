import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/opmCharacterItem.dart';

class CharacterGenerator {


  List<OpmCharacter> generate() {
    var characters = {"Zombieman": ["ZM", "zombieman"]};

    List<OpmCharacter> characterList = [];
    characters.forEach((key, value) {
      var name = key;
      var abbreviation = value[0];
      var imagePath = value[1];
      OpmCharacter opmCharacter = OpmCharacter(
          name: name.tr(),
          type: "${abbreviation}_type".tr(),
          imagePath: "repo/images/characters/${imagePath}.png",
          rarity: "SSR");

      List<Skill> skills = [];
      List<String> types = ["attack"];
      types.forEach((element) {
        Skill skill = Skill(name: "${abbreviation}_${element}_name".tr(),
            cost: 0,
            description: ["${abbreviation}_${element}_desc".tr()],
            type: "$element".tr());
        skills.add(skill);
      });
      opmCharacter.skills = skills;
      characterList.add(opmCharacter);
    });

    return characterList;
  }
}