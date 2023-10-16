import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_final_hib/src/home/repositories/pet_http_repository.dart';
import 'package:projeto_final_hib/src/shared/model/pet_model.dart';

void main() {
  test('Deve retornar uma lista de pets da API', () async {
    PetHttpRepository repository = PetHttpRepository();

    List<PetModel> pets = await repository.parsePetData(1, 10);
    expect(pets.isNotEmpty, true);
    expect(pets.first.id?.isNotEmpty, true);
  });

  test('Deve retornar os dados de um PET', () async {
    PetModel pet = PetModel(
      id: "0XYvRd7oD",
    );

    PetHttpRepository repository = PetHttpRepository();

    String data = await repository.loadPetInfo(pet);
    expect(data.isNotEmpty, true);
  });
}
