import 'dart:convert';

import 'package:http/http.dart' as http;

class DogFact {
  final String fact;

  const DogFact({
    required this.fact,
  });

  factory DogFact.fromJson(Map<String, dynamic> json) {
    return DogFact(
      fact: json['facts'][0],
    );
  }
}

Future<DogFact> fetchDogFacts() async {
  final response = await http
      .get(Uri.parse("https://dog-api.kinduff.com/api/facts?number=1"));

  if (response.statusCode == 200) {
    return DogFact.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to retrieve dog facts");
  }
}
