import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:notes_sqlite_mobx/models/Note.dart';
import 'package:notes_sqlite_mobx/screens/addNote/functions/define_color_fab.dart';
import 'package:notes_sqlite_mobx/screens/addNote/widgets/more_options.dart';
import 'package:notes_sqlite_mobx/stores/add_note_store.dart';

class AddNote extends StatefulWidget {
  final Note note;
  AddNote(this.note);
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  FocusNode _titleFocus = FocusNode();

  FocusNode _bodyFocus = FocusNode();

  TextEditingController _titleController = TextEditingController();

  TextEditingController _bodyController = TextEditingController();

  AddNoteStore _store = AddNoteStore();

  @override
  void initState() {
    _titleController.text = widget.note.title;
    _bodyController.text = widget.note.body;
    _store.changeNote(widget.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: _store.color,
        floatingActionButton: FloatingActionButton(
          backgroundColor: defineColorFab(_store.color),
          splashColor: defineColorFab(_store.color),
          tooltip: _store.note.id == -1 ? 'Salvar Nota' : "Atualizar Nota",
          child: const Icon(
            Icons.save,
          ),
          onPressed: () {
            _titleFocus.unfocus();
            _bodyFocus.unfocus();
            _store.addNote(context);
          },
        ),
        appBar: AppBar(
          backgroundColor: _store.color,
          title: Text(
            _store.note.id == -1 ? 'Nova Nota' : 'Atualizar Nota',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                _titleFocus.unfocus();
                _bodyFocus.unfocus();
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext ctx) {
                    return MoreOptions(
                      _store.color,
                      _store.changeColor,
                      () {
                        _store.deleteNote(context);
                      },
                      _store.note.id != -1,
                    );
                  },
                );
              },
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body: Container(
          color: Colors.transparent,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  onChanged: _store.changeTitle,
                  controller: _titleController,
                  focusNode: _titleFocus,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Título',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    counter: const SizedBox(),
                  ),
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  maxLength: 1024,
                ),
                TextField(
                  onChanged: _store.changeBody,
                  controller: _bodyController,
                  focusNode: _bodyFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nota',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
