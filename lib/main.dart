import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plasticity/views/splash_screen.dart';

import 'config/themes.dart';
// @dart=2.9

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plasticity',
      theme: lightTheme,
      home: SplashScreen(),
    );
  }
}

