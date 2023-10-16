import 'package:projeto_final_hib/src/shared/model/pet_model.dart';

abstract class IPetRepository {
  Future<List<PetModel>> loadCats(int size);

  Future<List<PetModel>> loadDogs(int size);

  Future<String> loadPetInfo(PetModel pet);
}
