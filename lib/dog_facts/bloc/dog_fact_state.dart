part of 'dog_fact_bloc.dart';

abstract class DogFactState extends Equatable {
  const DogFactState();
}

class DogFactLoadingState extends DogFactState {
  @override
  List<Object> get props => [];
}

class DogFactLoadedState extends DogFactState {
  final String fact;

  const DogFactLoadedState(this.fact);

  @override
  List<Object?> get props => [fact];
}