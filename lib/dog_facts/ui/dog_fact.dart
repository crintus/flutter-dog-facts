import 'package:dog_facts/dog_facts/bloc/dog_fact_bloc.dart';
import 'package:dog_facts/dog_facts/services/dog_fact_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogWidget extends StatelessWidget {

  const DogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogFactBloc(
        RepositoryProvider.of<DogFactService>(context),
      )..add(DogFactLoadApiEvent()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: BlocBuilder<DogFactBloc, DogFactState>(
              builder: (context, state) {
                if (state is DogFactLoadingState) {
                  return const CircularProgressIndicator();
                }
                if (state is DogFactLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.fact,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline5,
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
