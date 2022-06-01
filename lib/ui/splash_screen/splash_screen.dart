import 'package:flutter/material.dart';
import 'package:riverpod_app/settings/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.fetchDetailScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffFFFFFF),
      child: Center(
        child: Text(
          "River Pod Testing",
        ),
      ),
    );
  }
}
