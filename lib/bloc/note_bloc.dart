import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/noteRepo.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;
  NoteBloc({required this.noteRepository}) : super(NoteInitial()) {
    on<Create>((event, emit) async {
      emit(NoteAdding());
      await Future.delayed(
          const Duration(seconds: 1)); //felt cute may remove later
      try {
        await noteRepository.create(
            title: event.title, description: event.description);
        emit(NoteAdded());
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });

    on<GetData>((event, emit) async {
      emit(NoteLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final data = await noteRepository.get();
        emit(NoteLoaded(data));
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });

    // on<Delete>((event, emit) async {
    //   try {
    //     emit(NoteDeleting());
    //     await noteRepository.delete(id);
    //     emit(NoteDeleted());
    //   } catch (e) {
    //     emit(NoteError(e.toString()));
    //   }
    // });
  }
}
