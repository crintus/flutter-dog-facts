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