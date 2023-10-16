import 'package:projeto_final_hib/src/shared/model/pet_model.dart';

abstract class PetEvent {}

class LoadPetsEvent extends PetEvent {}

class LoadPetDetailsEvent extends PetEvent {
  final PetModel pet;

  LoadPetDetailsEvent(this.pet);
}

class ResetPetListEvent extends PetEvent {}
