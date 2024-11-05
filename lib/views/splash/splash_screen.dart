import 'package:appchat/utils/constants/key_pref.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Navigator,
        Scaffold,
        State,
        StatefulWidget,
        Widget;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import '../../config/route.dart' show RouteName, mapRouteName;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 0),
      () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        late String routeName;
        if (prefs.getBool(KeyPref.keyLoggedIn) ?? false) {
          routeName = mapRouteName[RouteName.main]!;
        } else {
          routeName = mapRouteName[RouteName.login]!;
        }
        if (mounted) {
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
