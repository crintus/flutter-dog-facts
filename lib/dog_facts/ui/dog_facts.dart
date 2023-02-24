import 'package:dog_facts/dog_facts/ui/dog_fact.dart';
import 'package:flutter/material.dart';

class DogFactsWidget extends StatefulWidget {
  const DogFactsWidget({super.key});

  @override
  State<DogFactsWidget> createState() => _DogFactsWidgetState();
}

class _DogFactsWidgetState extends State<DogFactsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DogWidget> listOfDogFacts = [
      const DogWidget(),
      const DogWidget()
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
            listOfDogFacts.add(const DogWidget());
          }
          return listOfDogFacts[index % listOfDogFacts.length];
        },
      ),
    );
  }
}