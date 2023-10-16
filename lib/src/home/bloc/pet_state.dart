import 'package:equatable/equatable.dart';
import 'package:projeto_final_hib/src/shared/model/pet_model.dart';

abstract class PetState extends Equatable {
  final List<PetModel> pets;
  final String? details;

  const PetState({required this.pets, this.details});

  @override
  List<Object?> get props => [pets, details];
}

class PetInitialState extends PetState {
  PetInitialState() : super(pets: []);
}

class PetEmptyState extends PetState {
  PetEmptyState() : super(pets: []);
}

class PetLoadingState extends PetState {
  PetLoadingState() : super(pets: []);
}

class PetErrorState extends PetState {
  PetErrorState() : super(pets: []);
}

class PetSuccessState extends PetState {
  const PetSuccessState({required List<PetModel> pets, String? details})
      : super(pets: pets, details: details);
}
