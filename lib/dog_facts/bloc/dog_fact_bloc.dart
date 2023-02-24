import 'package:bloc/bloc.dart';
import 'package:dog_facts/dog_facts/services/dog_fact_service.dart';
import 'package:equatable/equatable.dart';

part 'dog_fact_event.dart';
part 'dog_fact_state.dart';

class DogFactBloc extends Bloc<DogFactEvent, DogFactState> {
  final DogFactService _dogFactService;

  DogFactBloc(this._dogFactService) : super(DogFactLoadingState()) {
    on<DogFactLoadApiEvent>((event, emit) async {
      emit(DogFactLoadingState());
      final dogFact = await _dogFactService.getDogFact();
      emit(DogFactLoadedState(dogFact.fact));
    });
  }
}
