import 'dart:convert';
import 'package:dog_facts/api_key.dart';
import 'package:dog_facts/dog_facts/models/dog_image.dart';
import 'package:http/http.dart' as http;

class UnsplashService {
  Future<DogImage> getDogImage() async {
    final response = await http.get(
        Uri.parse("https://api.unsplash.com/photos/random?count=1&orientation=portrait&content_filter=high&query=Dog"),
        headers: {'Authorization': 'Client-ID $unsplashClientID'},
    );

    if (response.statusCode == 200) {
      return DogImage.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to retrieve dog image");
    }
  }
}