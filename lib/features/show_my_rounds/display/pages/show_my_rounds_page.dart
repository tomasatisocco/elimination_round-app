import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/display/cubit/authentication_cubit.dart';
import '../cubit/show_my_rounds_cubit.dart';

class ShowMyRoundsPage extends StatelessWidget {
  const ShowMyRoundsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Rounds'),
      ),
      body: BlocBuilder<ShowMyRoundsCubit, ShowMyRoundsState>(
          builder: (context, state) {
        if (state is ShowMyRoundsError) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(fontSize: 30, color: Colors.red),
            ),
          );
        } else if (state is ShowMyRoundsLoaded) {
          if (state.roundModels == null || state.roundModels!.isEmpty) {
            return const Center(
              child: Text('No se encontraron rounds'),
            );
          } else {
            return ListView.builder(
              itemCount: state.roundModels!.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, round) {
                return Container();
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              padding: const EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  context.read<AuthenticationCubit>().logOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                      size: 35,
                    ),
                    Text(
                      'Salir',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
