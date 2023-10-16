import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class BreedModel {
  String? name;
  String? vetStreetUrl;
  String? temperament;
  String? origin;
  String? description;
  String? lifeSpam;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? intelligence;
  int? socialNeeds;
  int? strangerFriendly;
  String? wikipediaUrl;

  BreedModel({
    this.name,
    this.vetStreetUrl,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpam,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.intelligence,
    this.socialNeeds,
    this.strangerFriendly,
    this.wikipediaUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'vetStreetUrl': vetStreetUrl,
      'temperament': temperament,
      'origin': origin,
      'description': description,
      'lifeSpam': lifeSpam,
      'adaptability': adaptability,
      'affectionLevel': affectionLevel,
      'childFriendly': childFriendly,
      'dogFriendly': dogFriendly,
      'energyLevel': energyLevel,
      'intelligence': intelligence,
      'socialNeeds': socialNeeds,
      'strangerFriendly': strangerFriendly,
      'wikipediaUrl': wikipediaUrl,
    };
  }

  factory BreedModel.fromMap(Map<String, dynamic> map) {
    return BreedModel(
      name: map['name'] != null ? map['name'] as String : null,
      vetStreetUrl:
          map['vetStreetUrl'] != null ? map['vetStreetUrl'] as String : null,
      temperament:
          map['temperament'] != null ? map['temperament'] as String : null,
      origin: map['origin'] != null ? map['origin'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      lifeSpam: map['lifeSpam'] != null ? map['lifeSpam'] as String : null,
      adaptability:
          map['adaptability'] != null ? map['adaptability'] as int : null,
      affectionLevel:
          map['affectionLevel'] != null ? map['affectionLevel'] as int : null,
      childFriendly:
          map['childFriendly'] != null ? map['childFriendly'] as int : null,
      dogFriendly:
          map['dogFriendly'] != null ? map['dogFriendly'] as int : null,
      energyLevel:
          map['energyLevel'] != null ? map['energyLevel'] as int : null,
      intelligence:
          map['intelligence'] != null ? map['intelligence'] as int : null,
      socialNeeds:
          map['socialNeeds'] != null ? map['socialNeeds'] as int : null,
      strangerFriendly: map['strangerFriendly'] != null
          ? map['strangerFriendly'] as int
          : null,
      wikipediaUrl:
          map['wikipediaUrl'] != null ? map['wikipediaUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BreedModel.fromJson(String source) =>
      BreedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BreedModel(name: $name, vetStreetUrl: $vetStreetUrl, temperament: $temperament, origin: $origin, description: $description, lifeSpam: $lifeSpam, adaptability: $adaptability, affectionLevel: $affectionLevel, childFriendly: $childFriendly, dogFriendly: $dogFriendly, energyLevel: $energyLevel, intelligence: $intelligence, socialNeeds: $socialNeeds, strangerFriendly: $strangerFriendly, wikipediaUrl: $wikipediaUrl)';
  }
}
