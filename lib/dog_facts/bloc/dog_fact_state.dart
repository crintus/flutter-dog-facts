part of 'dog_fact_bloc.dart';

abstract class DogFactState extends Equatable {
  const DogFactState();
}

class DogFactInitialState extends DogFactState {
  @override
  List<Object> get props => [];
}

class DogFactLoadingState extends DogFactState {
  @override
  List<Object> get props => [];
}

class DogFactLoadedState extends DogFactState {
  final String fact;
  final DogImage image;

  const DogFactLoadedState(this.fact, this.image);

  @override
  List<Object?> get props => [fact, image];
}