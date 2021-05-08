import 'package:mobx/mobx.dart';
import 'package:notes_sqlite_mobx/database/database_provider.dart';

import 'package:notes_sqlite_mobx/shared/shared_functions.dart';
import 'package:notes_sqlite_mobx/stores/note_store.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  String search = '';

  ObservableList<NoteStore> notes = ObservableList<NoteStore>();

  @observable
  int selectType = -1;

  @observable
  bool loadingNotes = true;

  @action
  Future<void> fetchList() async {
    loadingNotes = true;
    selectType = await SharedFunctions.getType();
    notes.addAll(await DatabaseProvider.db.getNotes());
    loadingNotes = false;
  }

  @action
  Future<void> setListType() async {
    if (selectType == 0) {
      selectType = 1;
      await SharedFunctions.setType(1);
    } else {
      selectType = 0;
      await SharedFunctions.setType(0);
    }
  }

  @action
  Future<void> setSeach(String value) async {
    if (value == '' || value == null) {
      search = '';
      loadingNotes = true;
      notes.clear();
      notes.addAll(await DatabaseProvider.db.getNotes());
      loadingNotes = false;
    } else {
      search = value;
      loadingNotes = true;
      notes.clear();
      notes.addAll(await DatabaseProvider.db.searchNotes(
        search: value.trim(),
      ));
      loadingNotes = false;
    }
  }

  @computed
  bool get isSearch => search.isNotEmpty;

  @computed
  List<NoteStore> get isSelected =>
      notes.where((element) => element.isSelected).toList();

  @action
  void notSelected() {
    isSelected.map((element) => element.changeSelected()).toList();
  }

  @action
  Future<void> removeItens() async {
    for (int i = 0; i < isSelected.length; i++) {
      DatabaseProvider.db.deleteNote(isSelected[i].note);
    }
    setSeach(search);
  }
}
