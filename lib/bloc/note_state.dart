import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../model/noteModel.dart';

@immutable
abstract class NoteState extends Equatable {}

class NoteInitial extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteAdding extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteAdded extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteError extends NoteState {
  final String error;

  NoteError(this.error);
  @override
  List<Object?> get props => [error];
}

class NoteLoading extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteLoaded extends NoteState {
  List<NoteModel> noteData;
  NoteLoaded(this.noteData);
  @override
  List<Object?> get props => [];
}

class NoteDeleting extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteDeleted extends NoteState {
  @override
  List<Object?> get props => [];
}
