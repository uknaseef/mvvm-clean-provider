import 'package:flutter/material.dart';
import 'package:mvvm_clean_provider/res/styles/fonts/inter_font.dart';
import 'package:mvvm_clean_provider/utils/routes/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteConstants.routeProductListingScreen,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Welcome', style: InterFontPalette.fBlack_10_500),
      ),
    );
  }
}
