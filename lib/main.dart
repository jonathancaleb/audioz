import 'package:audioz/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Rot of application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'audioz',
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}
