import 'package:bloc/bloc.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_event.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_state.dart';
import 'package:projeto_final_hib/src/home/repositories/pet_repository.dart';
import 'package:projeto_final_hib/src/shared/model/pet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  IPetRepository repository;

  PetBloc(
    this.repository,
  ) : super(PetInitialState()) {
    on<LoadPetsEvent>((event, emit) async {
      List<PetModel> newPets = [];
      List<PetModel> loadedPets = [];

      loadedPets.addAll(state.pets);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final type = prefs.get('type') ?? 0;

      try {
        switch (type) {
          case 0:
            newPets = await repository.loadCats(10);
            break;
          case 1:
            newPets = await repository.loadDogs(10);
            break;
          case 2:
            var cats = await repository.loadCats(5);
            var dogs = await repository.loadDogs(5);
            newPets.addAll(cats);
            newPets.addAll(dogs);
            newPets.shuffle();
            break;
        }
      } catch (e) {
        emit(PetErrorState());
      }

      loadedPets.addAll(newPets);
      emit(PetSuccessState(pets: loadedPets));
    });

    on<LoadPetDetailsEvent>((event, emit) async {
      try {
        var details = await repository.loadPetInfo(event.pet);
        emit(PetSuccessState(pets: state.pets, details: details));
      } catch (e) {
        emit(PetErrorState());
      }
    });

    on<ResetPetListEvent>((event, emit) {
      emit(PetInitialState());
    });
  }
}
