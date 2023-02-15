import 'package:dog_facts/dog/model.dart';
import 'package:flutter/material.dart';

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
      home: const DogFactWidget(),
    );
  }
}

class DogFactWidget extends StatefulWidget {
  const DogFactWidget({super.key});

  @override
  State<DogFactWidget> createState() => _DogFactWidgetState();
}

class _DogFactWidgetState extends State<DogFactWidget> {
  late Future<Dog> album;

  @override
  void initState() {
    super.initState();
    album = fetchDogFacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('D O G   F A C T S'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: FutureBuilder<Dog>(
            future: album,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.facts[0]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            album = fetchDogFacts();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
