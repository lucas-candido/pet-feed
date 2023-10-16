import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_bloc.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_event.dart';
import 'package:projeto_final_hib/src/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeSelectionScreen extends StatefulWidget {
  const TypeSelectionScreen({Key? key}) : super(key: key);

  static String routeName = '/type-selection';

  @override
  State<TypeSelectionScreen> createState() => _TypeSelectionScreenState();
}

class _TypeSelectionScreenState extends State<TypeSelectionScreen> {
  late final SharedPreferences prefs;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color.fromRGBO(22, 23, 34, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 300,
                  child: Image.asset('assets/logo-full.png'),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'What kind of person are you?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(66, 235, 251, 1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: Text(
                  'Cat Person'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  await prefs.setInt('type', 0).then((value) {
                    context.read<PetBloc>().add(ResetPetListEvent());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.routeName, (Route<dynamic> route) => false);
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: Text(
                  'Dog Person'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () async {
                  await prefs.setInt('type', 1).then((value) {
                    context.read<PetBloc>().add(ResetPetListEvent());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.routeName, (Route<dynamic> route) => false);
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(211, 30, 46, 1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: Text(
                  'Both'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  await prefs.setInt('type', 2).then((value) {
                    context.read<PetBloc>().add(ResetPetListEvent());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.routeName, (Route<dynamic> route) => false);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
