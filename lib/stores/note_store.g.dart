// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoteStore on _NoteStoreBase, Store {
  final _$noteAtom = Atom(name: '_NoteStoreBase.note');

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

  final _$isSelectedAtom = Atom(name: '_NoteStoreBase.isSelected');

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  final _$_NoteStoreBaseActionController =
      ActionController(name: '_NoteStoreBase');

  @override
  void changeSelected() {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.changeSelected');
    try {
      return super.changeSelected();
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
note: ${note},
isSelected: ${isSelected}
    ''';
  }
}
