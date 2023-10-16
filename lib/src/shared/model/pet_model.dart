import 'dart:convert';

import 'package:projeto_final_hib/src/shared/model/breed_model.dart';

class PetModel {
  final String? id;
  final String? url;
  final int? width;
  final int? height;
  final int? type;
  final String? data;
  final BreedModel? breedData;

  PetModel({
    this.id,
    this.url,
    this.width,
    this.height,
    this.type,
    this.data,
    this.breedData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'width': width,
      'height': height,
      'tipo': type,
      'data': data,
      'breedData': breedData,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'] != null ? map['id'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      type: map['type'] != null ? map['type'] as int : null,
      data: map['data'] != null ? map['data'] as String : null,
      breedData:
          map['breedData'] != null ? map['breedData'] as BreedModel : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PetModel copyWith({
    String? id,
    String? url,
    int? width,
    int? height,
    int? type,
    String? data,
    BreedModel? breedData,
  }) {
    return PetModel(
      id: id ?? this.id,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      type: type ?? this.type,
      data: data ?? this.data,
      breedData: breedData ?? this.breedData,
    );
  }
}
