import 'package:dog_facts/dog_facts/services/dog_fact_service.dart';
import 'package:dog_facts/dog_facts/ui/dog_facts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => DogFactService())
        ],
        child: const DogFactsWidget(),
      ),
    );
  }
}

