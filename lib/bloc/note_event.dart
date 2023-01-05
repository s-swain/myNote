import 'package:equatable/equatable.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object> get props => [];

  // get title => null;
  //
  // get description => null;
}

class Create extends NoteEvent {
  //@override
  final String title;
  //@override
  final String description;

  Create(this.title, this.description);
}

class GetData extends NoteEvent {
  GetData();
}

class Delete extends NoteEvent {
  Delete();
}
