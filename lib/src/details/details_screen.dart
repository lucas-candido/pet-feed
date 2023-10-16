import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_bloc.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_state.dart';
import 'package:projeto_final_hib/src/shared/model/pet_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as PetModel;
    var breed = args.breedData!;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 23, 34, 1),
      body: BlocBuilder<PetBloc, PetState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formatBreedData(
                          breed.affectionLevel, "Affection Level", true),
                      formatBreedData(breed.adaptability, "Adaptability", true),
                      formatBreedData(
                          breed.childFriendly, "Child Friendly", true),
                      formatBreedData(breed.description, "Description", false),
                      formatBreedData(breed.dogFriendly, "Dog Friendly", true),
                      formatBreedData(breed.energyLevel, "Energy Level", true),
                      formatBreedData(breed.intelligence, "Intelligency", true),
                      formatBreedData(breed.lifeSpam, "Life Spam", false),
                      formatBreedData(breed.name, "Name", false),
                      formatBreedData(breed.origin, "Origin", false),
                      formatBreedData(breed.socialNeeds, "Social Needs", true),
                      formatBreedData(
                          breed.strangerFriendly, "Stranger Friendly", true),
                      formatBreedData(breed.temperament, "Temperament", false),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget formatBreedData(dynamic attribute, String label, bool rating) {
    return (attribute != null)
        ? Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$label:",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: "\n${(attribute)}${(rating ? "/5" : "")}\n",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
