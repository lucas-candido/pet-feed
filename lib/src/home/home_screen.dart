import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_final_hib/src/details/details_screen.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_bloc.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_event.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_state.dart';
import 'package:projeto_final_hib/src/type_selection/type_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();

  @override
  void initState() {
    setState(() {
      fetch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Image.asset(
            'assets/logo-full.png',
            height: 35,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TypeSelectionScreen.routeName);
              },
              icon: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Icon(Icons.settings_outlined),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: BlocBuilder<PetBloc, PetState>(
          builder: (context, state) {
            if (state is PetErrorState) {
              return const Text(
                'Nada a exibir',
                style: TextStyle(
                  color: Colors.white,
                ),
              );
            } else if (state is PetErrorState) {
              return const Text(
                'Falha ao carregar',
                style: TextStyle(
                  color: Colors.white,
                ),
              );
            } else if (state is PetInitialState || state is PetLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is PetSuccessState) {
              return PageView.builder(
                onPageChanged: (value) {
                  setState(() {});
                },
                controller: controller,
                scrollDirection: Axis.vertical,
                pageSnapping: true,
                itemCount: state.pets.length,
                itemBuilder: ((context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Image.network(
                          state.pets[index].url!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Image.network(
                        state.pets[index].url!,
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              state.pets[index].breedData?.name ??
                                  'Unknown Breed',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              state.pets[index].breedData?.temperament ??
                                  'Unknown temperament',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              state.pets[index].breedData?.wikipediaUrl ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                            (state.pets[index].breedData != null)
                                ? InkWell(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(DetailsScreen.routeName,
                                            arguments: state.pets[index]),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.info_outline,
                                            color: Colors.white),
                                        SizedBox(width: 10),
                                        Text(
                                          'More info',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  fetch() {
    context.read<PetBloc>().add(LoadPetsEvent());
  }

  List<Icon> buildStarLine(int count) {
    return List.generate(
        count,
        (i) => const Icon(
              Icons.star,
              color: Colors.green,
            )).toList();
  }
}
