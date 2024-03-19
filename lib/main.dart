import 'package:flutter/material.dart';
import 'package:task/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(139, 136, 239, 1),
            primary: Colors.black,
            secondary: Colors.grey,
            tertiary: const Color.fromARGB(255, 27, 27, 27),
            surface: Colors.grey[900],
            error:  const Color.fromRGBO(139, 136, 239, 1),
            brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
