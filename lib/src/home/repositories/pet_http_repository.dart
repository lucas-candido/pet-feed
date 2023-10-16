import 'dart:convert';
import 'dart:io';

import 'package:projeto_final_hib/src/constants.dart';
import 'package:projeto_final_hib/src/home/repositories/pet_repository.dart';
import 'package:projeto_final_hib/src/shared/model/breed_model.dart';
import 'package:projeto_final_hib/src/shared/model/pet_model.dart';
import 'package:http/http.dart' as http;

class PetHttpRepository implements IPetRepository {
  @override
  Future<List<PetModel>> loadCats(int size) async => parsePetData(0, size);

  @override
  Future<List<PetModel>> loadDogs(int size) async => parsePetData(1, size);

  @override
  Future<String> loadPetInfo(PetModel pet) async {
    String url =
        (pet.type == 0 ? catDetailsApi : dogDetailsApi) + (pet.id ?? '');

    try {
      var response = await http.get(Uri.parse(url));
      return response.body.toString();
    } catch (e) {
      throw const HttpException("Falha ao carregar as informações do pet");
    }
  }

  Future<List<PetModel>> parsePetData(int type, int size) async {
    List<PetModel> pets = [];

    var url = Uri.parse('${(type == 0 ? catApi : dogApi)}$size');
    try {
      var response = await http.get(url);
      var parsed = jsonDecode(response.body) as List;

      for (var element in parsed) {
        var map = element as Map<String, dynamic>;
        var pet = PetModel.fromMap(map);
        pet = pet.copyWith(type: type);

        var data = await loadPetInfo(pet);
        pet = pet.copyWith(data: data);

        var json = jsonDecode(data)['breeds'];
        if (json != null) {
          pet = pet.copyWith(
            breedData: BreedModel.fromJson(
              jsonEncode(json[0]),
            ),
          );
        }

        pets.add(pet);
      }
    } catch (e) {
      throw const HttpException("Falha ao processar a lista de pets");
    }

    return pets;
  }
}
