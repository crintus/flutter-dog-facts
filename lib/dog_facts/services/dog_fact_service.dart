import 'dart:convert';

import 'package:dog_facts/dog_facts/models/dog_fact.dart';
import 'package:http/http.dart' as http;

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