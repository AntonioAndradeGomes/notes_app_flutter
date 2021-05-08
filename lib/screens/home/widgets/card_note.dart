import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:notes_sqlite_mobx/stores/note_store.dart';

class NoteCard extends StatelessWidget {
  final NoteStore note;
  final bool actionSelect;

  NoteCard({
    @required this.note,
    @required this.actionSelect,
  });

  double _fontSize;

  @override
  Widget build(BuildContext context) {
    //print(note.title);
    _fontSize = _determineFontSizeBody();
    return InkWell(
        splashColor: Colors.white,
        onLongPress: note.changeSelected,
        onTap: () {
          if (actionSelect) {
            note.changeSelected();
          } else {
            Navigator.pushNamed(
              context,
              '/AddNote',
              arguments: note.note,
            );
          }
        },
        child: Observer(
          builder: (_) => Container(
            decoration: BoxDecoration(
              color: note.isSelected
                  ? note.note.noteColor.withAlpha(100)
                  : note.note.noteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.white,
                width: note.isSelected ? 3 : 0.5,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                note.note.title.length != 0
                    ? AutoSizeText(
                        note.note.title,
                        style: TextStyle(
                          fontSize: _fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: note.note.title.length == 0 ? 1 : 3,
                        textScaleFactor: 1.5,
                      )
                    : const SizedBox(),
                AutoSizeText(
                  note.note.body,
                  style: TextStyle(
                    fontSize: _fontSize,
                    color: Colors.white,
                  ),
                  maxLines: 10,
                  textScaleFactor: 1.5,
                ),
              ],
            ),
          ),
        ));
  }

  double _determineFontSizeBody() {
    int charCount = note.note.body.length + note.note.title.length;
    double fontSize = 18;
    if (charCount > 120) {
      fontSize = 10;
    } else if (charCount > 80) {
      fontSize = 12;
    } else if (charCount > 50) {
      fontSize = 14;
    } else if (charCount > 20) {
      fontSize = 16;
    }
    return fontSize;
  }
}
