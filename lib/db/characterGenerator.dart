import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opm_the_strongest_db/opmCharacterItem.dart';

class CharacterGenerator {
  List<OpmCharacter> generate() {
    var characters = {
      "Zombieman": ["ZM", "zombieman"],
      "Amai Mask": ["AM", "amai_mask"],
      "Atomic Samurai": ["AS", "atomic_samurai"],
      "Child Emperor": ["CE", "child_emperor"],
      "Hellish Fubuki": ["HF", "fubuki"],
      "Genos": ["GN", "genos"],
      "King": ["KG", "king"],
    };

    List<OpmCharacter> characterList = [];
    characters.forEach((key, value) {
      var name = key;
      var abbreviation = value[0];
      var imagePath = value[1];
      OpmCharacter opmCharacter = OpmCharacter(
          name: name.tr(),
          type: "${abbreviation}_type".tr(),
          imagePath: "repo/images/characters/${imagePath}.png",
          rarity: "SSR",
          faction: "${abbreviation}_faction".tr(),
          abbreviation: abbreviation);

      List<Skill> skills = [];
      List<String> types = [
        "attack",
        "ultimate",
        "passive",
        "ultra_ultimate",
        "ultra_passive"
      ];
      types.forEach((element) {
        String mappingName = "${abbreviation}_${element}_name";
        Skill skill = Skill(
            name: "${abbreviation}_${element}_name".tr(),
            cost: 0,
            description: ["${abbreviation}_${element}_desc".tr()],
            type: "$element");

        if ("${abbreviation}_${element}_name".tr() != '' &&
            mappingName != skill.name) {
          skills.add(skill);
        }
      });
      opmCharacter.skills = skills;

      String roles = '${abbreviation}_roles'.tr();
      opmCharacter.roles = roles;

      characterList.add(opmCharacter);
    });

    return characterList;
  }
}
