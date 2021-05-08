import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:notes_sqlite_mobx/models/Note.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  @observable
  Note note;

  @observable
  bool isSelected = false;

  _NoteStoreBase({
    @required this.note,
    this.isSelected = false,
  });

  @action
  void changeSelected() => isSelected = !isSelected;
}
