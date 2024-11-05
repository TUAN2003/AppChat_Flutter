import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'config/config.dart';
import 'providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .timeout(const Duration(seconds: 5));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RoomsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: themeData,
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
