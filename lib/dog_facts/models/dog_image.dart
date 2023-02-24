class DogImage {
  final String url;
  final String description;

  const DogImage({
    required this.url,
    required this.description,
  });

  factory DogImage.fromJson(List<dynamic> json) {
    return DogImage(
      url: json[0]['urls']['regular'],
      description: json[0]['description'] ?? json[0]['alt_description'],
    );
  }
}