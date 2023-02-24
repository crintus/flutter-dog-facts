import 'package:dog_facts/dog_facts/bloc/dog_fact_bloc.dart';
import 'package:dog_facts/dog_facts/services/dog_fact_service.dart';
import 'package:dog_facts/dog_facts/services/unsplash_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogWidget extends StatelessWidget {

  const DogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            DogFactBloc(
              RepositoryProvider.of<DogFactService>(context),
              RepositoryProvider.of<UnsplashService>(context),
            ),
        child: BlocBuilder<DogFactBloc, DogFactState>(
          builder: (context, state) {
            if (state is DogFactInitialState) {
              BlocProvider.of<DogFactBloc>(context).add(
                  DogFactLoadApiEvent());
            }
            if (state is DogFactLoadingState) {
              return const Card(child: Center(child: CircularProgressIndicator(),),);
            }
            if (state is DogFactLoadedState) {
              return Card(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: NetworkImage(state.image.url),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          state.fact,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              );
            }
            return Container();
          },
        )
    );
  }
}
