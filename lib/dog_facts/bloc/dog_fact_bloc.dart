import 'package:bloc/bloc.dart';
import 'package:dog_facts/dog_facts/models/dog_image.dart';
import 'package:dog_facts/dog_facts/services/dog_fact_service.dart';
import 'package:dog_facts/dog_facts/services/unsplash_service.dart';
import 'package:equatable/equatable.dart';

part 'dog_fact_event.dart';
part 'dog_fact_state.dart';

class DogFactBloc extends Bloc<DogFactEvent, DogFactState> {
  final DogFactService _dogFactService;
  final UnsplashService _unsplashService;

  DogFactBloc(this._dogFactService, this._unsplashService) : super(DogFactInitialState()) {
    on<DogFactLoadApiEvent>((event, emit) async {
      emit(DogFactLoadingState());
      final dogFact = await _dogFactService.getDogFact();
      final dogImage = await _unsplashService.getDogImage();
      emit(DogFactLoadedState(dogFact.fact, dogImage));
    });
  }
}
