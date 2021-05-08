// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddNoteStore on _AddNoteStoreBase, Store {
  final _$titleAtom = Atom(name: '_AddNoteStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$bodyAtom = Atom(name: '_AddNoteStoreBase.body');

  @override
  String get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  final _$colorAtom = Atom(name: '_AddNoteStoreBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$noteAtom = Atom(name: '_AddNoteStoreBase.note');

  @override
  Note get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(Note value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  final _$addNoteAsyncAction = AsyncAction('_AddNoteStoreBase.addNote');

  @override
  Future<void> addNote(BuildContext context) {
    return _$addNoteAsyncAction.run(() => super.addNote(context));
  }

  final _$deleteNoteAsyncAction = AsyncAction('_AddNoteStoreBase.deleteNote');

  @override
  Future<void> deleteNote(BuildContext context) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(context));
  }

  final _$_AddNoteStoreBaseActionController =
      ActionController(name: '_AddNoteStoreBase');

  @override
  void changeTitle(String value) {
    final _$actionInfo = _$_AddNoteStoreBaseActionController.startAction(
        name: '_AddNoteStoreBase.changeTitle');
    try {
      return super.changeTitle(value);
    } finally {
      _$_AddNoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBody(String value) {
    final _$actionInfo = _$_AddNoteStoreBaseActionController.startAction(
        name: '_AddNoteStoreBase.changeBody');
    try {
      return super.changeBody(value);
    } finally {
      _$_AddNoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeColor(Color value) {
    final _$actionInfo = _$_AddNoteStoreBaseActionController.startAction(
        name: '_AddNoteStoreBase.changeColor');
    try {
      return super.changeColor(value);
    } finally {
      _$_AddNoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNote(Note value) {
    final _$actionInfo = _$_AddNoteStoreBaseActionController.startAction(
        name: '_AddNoteStoreBase.changeNote');
    try {
      return super.changeNote(value);
    } finally {
      _$_AddNoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
body: ${body},
color: ${color},
note: ${note}
    ''';
  }
}
