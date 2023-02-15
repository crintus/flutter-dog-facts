import 'dart:convert';

import 'package:http/http.dart' as http;

class Dog {
  final List<dynamic> facts;

  const Dog({
    required this.facts,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      facts: json['facts'],
    );
  }
}

Future<Dog> fetchDogFacts() async {
  final response = await http
      .get(Uri.parse("https://dog-api.kinduff.com/api/facts?number=1"));

  if (response.statusCode == 200) {
    return Dog.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to retrieve dog facts");
  }
}
