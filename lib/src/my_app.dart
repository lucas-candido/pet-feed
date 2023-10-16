import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_final_hib/src/home/bloc/pet_bloc.dart';
import 'package:projeto_final_hib/src/home/repositories/pet_http_repository.dart';
import 'package:projeto_final_hib/src/routes.dart';
import 'package:projeto_final_hib/src/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PetBloc(PetHttpRepository())),
      ],
      child: MaterialApp(
        title: 'Pet Feed',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
