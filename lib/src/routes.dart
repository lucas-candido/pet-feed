import 'package:flutter/material.dart';
import 'package:projeto_final_hib/src/details/details_screen.dart';
import 'package:projeto_final_hib/src/home/home_screen.dart';
import 'package:projeto_final_hib/src/splash/splash_screen.dart';
import 'package:projeto_final_hib/src/type_selection/type_selection_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  TypeSelectionScreen.routeName: (context) => const TypeSelectionScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
};
