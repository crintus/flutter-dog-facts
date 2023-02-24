import 'dart:convert';

import 'package:http/http.dart' as http;

// {"facts":["Dogs in a pack are more likely to chase and hunt than a single dog on its own. Two dogs are enough to form a pack."],"success":true}

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


class DogFactService {
  Future<DogFact> getDogFact() async {
    final response = await http
        .get(Uri.parse("https://dog-api.kinduff.com/api/facts?number=1"));

    if (response.statusCode == 200) {
      return DogFact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to retrieve dog facts");
    }
  }
}