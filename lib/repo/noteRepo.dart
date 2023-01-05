import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/noteModel.dart';

class NoteRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("Notes");

  Future<void> create(
      {required String title, required String description}) async {
    try {
      await _fireCloud.add({"Title": title, "Description": description});
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error : '${e.code}':${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<NoteModel>> get() async {
    List<NoteModel> listOfNotes = [];
    try {
      final note = await FirebaseFirestore.instance.collection("Notes").get();

      note.docs.forEach((element) {
        return listOfNotes.add(NoteModel.fromJson(element.data()));
      });
      return listOfNotes;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with '${e.code}':${e.message}");
      }
      return listOfNotes;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> delete(id) async {
    FirebaseFirestore.instance.collection("Notes").doc(id).delete();
  }
}
