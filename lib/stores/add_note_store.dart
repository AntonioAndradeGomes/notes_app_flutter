import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:notes_sqlite_mobx/consts.dart';
import 'package:notes_sqlite_mobx/database/database_provider.dart';
import 'package:notes_sqlite_mobx/models/Note.dart';
part 'add_note_store.g.dart';

class AddNoteStore = _AddNoteStoreBase with _$AddNoteStore;

abstract class _AddNoteStoreBase with Store {
  @observable
  String title = '';

  @observable
  String body = '';

  @observable
  Color color = CORES[0];

  @observable
  Note note = Note(
    id: -1,
    body: '',
    title: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    noteColor: CORES[0],
  );

  @action
  void changeTitle(String value) => title = value;

  @action
  void changeBody(String value) => body = value;

  @action
  void changeColor(Color value) => color = value;

  @action
  void changeNote(Note value) {
    note = value;
    title = note.title;
    body = note.body;
    color = note.noteColor;
  }

  @action
  Future<void> addNote(BuildContext context) async {
    if (title == body && body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Digite um título ou a descrição da nota',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
    } else if (note.id == -1) {
      Note noteAdd = Note(
        title: title,
        body: body,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        noteColor: color,
      );
      await DatabaseProvider.db.addNewNote(noteAdd);
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } else {
      Note noteUpadate = Note(
        id: note.id,
        title: title,
        body: body,
        createdAt: note.createdAt,
        noteColor: color,
        updatedAt: DateTime.now(),
      );
      await DatabaseProvider.db.updateNote(noteUpadate);
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  @action
  Future<void> deleteNote(BuildContext context) async {
    if (note.id != -1) {
      await DatabaseProvider.db.deleteNote(note);
    }
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
