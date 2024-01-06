// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Plant {
  String? plantImage;
  String? familyName;
  String? genus;
  String? rank;
  String? scientificName;
  String? name;
  Plant({
    this.plantImage,
    this.familyName,
    this.genus,
    this.rank,
    this.scientificName,
    this.name,
  });
 String? get getPlantImage => this.plantImage;

 set setPlantImage(String plantImage) => this.plantImage = plantImage;

 String? get getFamilyName => this.familyName;

 set setFamilyName(String familyName) => this.familyName = familyName;

 String? get getGenus => this.genus;

 set setGenus(String genus) => this.genus = genus;

 String? get getRank => this.rank;

 set setRank(String rank) => this.rank = rank;

 String? get getScientificName => this.scientificName;

 set setScientificName(String scientificName) => this.scientificName = scientificName;

 String? get getName => this.name;

 set setName(String name) => this.name = name;
 


 

  Plant copyWith({
    String? plantImage,
    String? familyName,
    String? genus,
    String? rank,
    String? scientificName,
    String? name,
  }) {
    return Plant(
      plantImage: plantImage ?? this.plantImage,
      familyName: familyName ?? this.familyName,
      genus: genus ?? this.genus,
      rank: rank ?? this.rank,
      scientificName: scientificName ?? this.scientificName,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'plantImage': plantImage,
      'familyName': familyName,
      'genus': genus,
      'rank': rank,
      'scientificName': scientificName,
      'name': name,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
      plantImage: map['plantImage'] != null ? map['plantImage'] as String : null,
      familyName: map['familyName'] != null ? map['familyName'] as String : null,
      genus: map['genus'] != null ? map['genus'] as String : null,
      rank: map['rank'] != null ? map['rank'] as String : null,
      scientificName: map['scientificName'] != null ? map['scientificName'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plant.fromJson(String source) => Plant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Plant(plantImage: $plantImage, familyName: $familyName, genus: $genus, rank: $rank, scientificName: $scientificName, name: $name)';
  }

  @override
  bool operator ==(covariant Plant other) {
    if (identical(this, other)) return true;
  
    return 
      other.plantImage == plantImage &&
      other.familyName == familyName &&
      other.genus == genus &&
      other.rank == rank &&
      other.scientificName == scientificName &&
      other.name == name;
  }

  @override
  int get hashCode {
    return plantImage.hashCode ^
      familyName.hashCode ^
      genus.hashCode ^
      rank.hashCode ^
      scientificName.hashCode ^
      name.hashCode;
  }
}
