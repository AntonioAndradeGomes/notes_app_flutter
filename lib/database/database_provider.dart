import 'package:flutter/cupertino.dart';
import 'package:notes_sqlite_mobx/models/Note.dart';
import 'package:notes_sqlite_mobx/stores/note_store.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  static Database _database;

  final _databaseName = 'note_app_mobx_2.db';

  final _tableName = 'notes';

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        await db.execute(
          '''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              body TEXT,
              noteColor INTEGER,
              createdAt DATE,
              updatedAt DATE
            )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<Note> addNewNote(Note note) async {
    final db = await database;
    db.insert(
      _tableName,
      note.toMap(false),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return note;
  }

  Future<List<NoteStore>> getNotes() async {
    final db = await database;
    var res = await db.query(_tableName);
    return res.isNotEmpty
        ? res.map((e) => NoteStore(note: Note.fromJson(e))).toList()
        : [];
  }

  Future<List<NoteStore>> searchNotes({
    @required String search,
  }) async {
    final db = await database;
    var res = await db.query(
      _tableName,
      where: "title LIKE ? OR body LIKE ?",
      whereArgs: ['%$search%', '%$search%'],
    );
    return res.isNotEmpty
        ? res.map((e) => NoteStore(note: Note.fromJson(e))).toList()
        : [];
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    return db.update(
      _tableName,
      note.toMap(true),
      where: "id = ?",
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(Note note) async {
    final db = await database;
    db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [note.id],
    );
  }
}
