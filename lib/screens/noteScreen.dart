import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/bloc/note_bloc.dart';
import 'package:my_notes/bloc/note_event.dart';
import 'package:my_notes/bloc/note_state.dart';
import 'package:my_notes/model/noteModel.dart';
import 'package:my_notes/screens/noteDetailScreen.dart';
import '../custom_widgets/noteDescriptionField.dart';
import '../custom_widgets/noteTitleField.dart';
import '../utilities/utils.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _addNote() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: Text(
                      "Add Note",
                      style: safeGoogleFont(
                        'Rowdies',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        height: 1.3333333333,
                        letterSpacing: -0.24,
                        color: Colors.blueAccent,
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  NoteTitle(controller: _titleController),
                  const SizedBox(height: 20),
                  DescriptionField(controller: _descriptionController),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          final String title = _titleController.text;
                          final String description =
                              _descriptionController.text;
                          if (description != null) {
                            _postNote(context);
                            _titleController.text = '';
                            _descriptionController.text = '';
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Add Note')),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _postNote(context) {
    BlocProvider.of<NoteBloc>(context).add(
      Create(_titleController.text, _descriptionController.text),
    );
  }

  Future<void> _delete() async {
    BlocProvider.of<NoteBloc>(context).add(Delete());
  }

  @override
  void initState() {
    BlocProvider.of<NoteBloc>(context).add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('My Note +'),
        ),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
        if (state is NoteLoaded) {
          List<NoteModel> data = state.noteData;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteDetail(
                          title: data[index].title.toString(),
                          description: data[index].description.toString(),
                        ),
                      ));
                },
                child: Container(
                  width: 200,
                  height: 120,
                  margin: const EdgeInsets.only(top: 7, bottom: 7),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70),
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x140e443e),
                        offset: Offset(0, 0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(7.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].title,
                          style: safeGoogleFont(
                            'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.3333333333,
                            letterSpacing: -0.24,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data[index].description,
                          style: safeGoogleFont(
                            'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.3333333333,
                            letterSpacing: -0.24,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is NoteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            child: const Icon(
              Icons.signal_wifi_connected_no_internet_4,
              size: 20,
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
