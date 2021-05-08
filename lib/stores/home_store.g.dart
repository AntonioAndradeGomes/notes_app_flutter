// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool> _$isSearchComputed;

  @override
  bool get isSearch => (_$isSearchComputed ??=
          Computed<bool>(() => super.isSearch, name: '_HomeStoreBase.isSearch'))
      .value;
  Computed<List<NoteStore>> _$isSelectedComputed;

  @override
  List<NoteStore> get isSelected => (_$isSelectedComputed ??=
          Computed<List<NoteStore>>(() => super.isSelected,
              name: '_HomeStoreBase.isSelected'))
      .value;

  final _$searchAtom = Atom(name: '_HomeStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$selectTypeAtom = Atom(name: '_HomeStoreBase.selectType');

  @override
  int get selectType {
    _$selectTypeAtom.reportRead();
    return super.selectType;
  }

  @override
  set selectType(int value) {
    _$selectTypeAtom.reportWrite(value, super.selectType, () {
      super.selectType = value;
    });
  }

  final _$loadingNotesAtom = Atom(name: '_HomeStoreBase.loadingNotes');

  @override
  bool get loadingNotes {
    _$loadingNotesAtom.reportRead();
    return super.loadingNotes;
  }

  @override
  set loadingNotes(bool value) {
    _$loadingNotesAtom.reportWrite(value, super.loadingNotes, () {
      super.loadingNotes = value;
    });
  }

  final _$fetchListAsyncAction = AsyncAction('_HomeStoreBase.fetchList');

  @override
  Future<void> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  final _$setListTypeAsyncAction = AsyncAction('_HomeStoreBase.setListType');

  @override
  Future<void> setListType() {
    return _$setListTypeAsyncAction.run(() => super.setListType());
  }

  final _$setSeachAsyncAction = AsyncAction('_HomeStoreBase.setSeach');

  @override
  Future<void> setSeach(String value) {
    return _$setSeachAsyncAction.run(() => super.setSeach(value));
  }

  final _$removeItensAsyncAction = AsyncAction('_HomeStoreBase.removeItens');

  @override
  Future<void> removeItens() {
    return _$removeItensAsyncAction.run(() => super.removeItens());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void notSelected() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.notSelected');
    try {
      return super.notSelected();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
selectType: ${selectType},
loadingNotes: ${loadingNotes},
isSearch: ${isSearch},
isSelected: ${isSelected}
    ''';
  }
}
