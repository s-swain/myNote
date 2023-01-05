import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/bloc/note_bloc.dart';
import 'package:my_notes/bloc/note_state.dart';
import 'package:my_notes/screens/noteScreen.dart';

import '../repo/noteRepo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => NoteBloc(
          noteRepository: RepositoryProvider.of<NoteRepository>(context)),
      child: Scaffold(
        key: scaffoldKey,
        body: BlocListener<NoteBloc, NoteState>(
          listener: (context, state) {
            if (state is NoteAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Note Added"),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
          child: BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              if (state is NoteAdding) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NoteError) {
                return const Center(
                  child: Text(
                      "Children we are facing a bit error we will be right back"),
                );
              }
              return const NoteScreen();
            },
          ),
        ),
      ),
    );
  }
}
