part of 'dog_fact_bloc.dart';

abstract class DogFactEvent extends Equatable {
  const DogFactEvent();
}

class DogFactLoadApiEvent extends DogFactEvent {
  @override
  List<Object?> get props => [];
}
