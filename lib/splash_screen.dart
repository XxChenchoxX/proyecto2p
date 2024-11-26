import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/pages.dart';
import 'utils/color_palette.dart';
import 'utils/font_sizes.dart';
import 'components/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  Future<void> _startTimer() async {
    // Simula un tiempo de carga
    await Future.delayed(const Duration(milliseconds: 3000));

    // Verifica el estado del login
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Redirige según el estado
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, Pages.home);
    } else {
      Navigator.pushReplacementNamed(context, Pages.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              width: 100,
            ),
            const SizedBox(height: 20),
            buildText(
              'To do List',
              kWhiteColor,
              textBold,
              FontWeight.w600,
              TextAlign.center,
              TextOverflow.clip,
            ),
            const SizedBox(height: 10),
            buildText(
              'Programe su semana con facilidad',
              kWhiteColor,
              textTiny,
              FontWeight.normal,
              TextAlign.center,
              TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
