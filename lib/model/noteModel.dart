class NoteModel {
  final String title;
  final String description;

  NoteModel({required this.title, required this.description});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(title: json['Title'], description: json['Description']);
  }
}
