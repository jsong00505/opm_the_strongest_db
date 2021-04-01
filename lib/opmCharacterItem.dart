import 'package:flutter/material.dart';

class OpmCharacter {
  String imagePath;
  String name;
  String type;
  String rarity;
  String characterClass;
  String faction;
  List<String> roles;
  List<Skill> skills;
  List<Stat> stats;
  List<Perk> perks;
  List<Costume> costumes;

  OpmCharacter(
      {@required this.name,
      @required this.type,
      @required this.imagePath,
      @required this.rarity,
      @required this.faction,
      this.roles,
      this.skills,
      this.stats,
      this.perks,
      this.costumes});
}

class Skill {
  String name;
  int cost;
  List<String> description;
  String type;
  String imagePath;

  Skill(
      {@required this.name,
      @required this.cost,
      @required this.description,
      @required this.type,
      this.imagePath});
}

class Stat {
  String name;
  String stat;

  Stat({@required this.name, @required this.stat});
}

class Perk {
  String name;
  String description;
  List<String> items;
}

class Costume {
  String name;
  String imagePath;
  String details;
  String collectionRewards;
}
