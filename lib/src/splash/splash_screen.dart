import 'package:flutter/material.dart';
import 'package:projeto_final_hib/src/home/home_screen.dart';
import 'package:projeto_final_hib/src/type_selection/type_selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    animate().then((value) async => {
          await Future.delayed(const Duration(seconds: 5))
              .then((value) => init()),
        });
    super.initState();
  }

  bool _visible = false;

  Future<void> animate() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
  }

  init() async {
    var prefs = await SharedPreferences.getInstance();
    var type = prefs.getInt('type');
    if (type == null) {
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            TypeSelectionScreen.routeName, (Route<dynamic> route) => false);
      }
    } else {
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 23, 34, 1),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
      ),
    );
  }
}
