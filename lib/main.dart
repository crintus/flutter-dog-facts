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
  late Future<DogFact> dogFacts;

  @override
  void initState() {
    super.initState();
    // dogFacts = fetchDogFacts(3);
  }

  @override
  Widget build(BuildContext context) {
    final List<DogWidget> listOfDogFacts = [
      DogWidget(fact: fetchDogFacts()),
      DogWidget(fact: fetchDogFacts())
    ];
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('D O G   F A C T S'),
      ),
      body: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (index % listOfDogFacts.length == listOfDogFacts.length - 1) {
            listOfDogFacts.add(DogWidget(fact: fetchDogFacts()));
          }
          return listOfDogFacts[index % listOfDogFacts.length];
        },
      ),
    );
  }
}

class DogWidget extends StatelessWidget {
  final Future<DogFact> fact;

  const DogWidget({
    Key? key,
    required this.fact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Center(
          child: FutureBuilder<DogFact>(
            future: fact,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    snapshot.data!.fact,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
