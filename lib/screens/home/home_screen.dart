import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_sqlite_mobx/consts.dart';
import 'package:notes_sqlite_mobx/models/Note.dart';

import 'package:notes_sqlite_mobx/screens/home/widgets/card_note.dart';
import 'package:notes_sqlite_mobx/stores/home_store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeStore _homeStore = HomeStore();

  FocusNode _appBarFocus = FocusNode();

  TextEditingController _appBarController = TextEditingController();

  @override
  void initState() {
    _homeStore.fetchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return _homeStore.isSelected.isNotEmpty
                ? Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _homeStore.notSelected();
                        },
                        splashRadius: 20,
                      ),
                      Text(
                        _homeStore.isSelected.length.toString(),
                      )
                    ],
                  )
                : TextField(
                    controller: _appBarController,
                    focusNode: _appBarFocus,
                    onChanged: _homeStore.setSeach,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Pesquise suas notas',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  );
          }),
          actions: [
            Observer(
              builder: (_) =>
                  _homeStore.isSearch && _homeStore.isSelected.isEmpty
                      ? IconButton(
                          icon: Icon(Icons.cancel_outlined),
                          onPressed: () {
                            _homeStore.setSeach('');
                            _appBarController.text = '';
                            _appBarFocus.unfocus();
                          },
                        )
                      : const SizedBox(),
            ),
            Observer(
              builder: (_) => _homeStore.selectType == -1 ||
                      _homeStore.isSelected.isNotEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: _homeStore.setListType,
                      icon: Icon(
                        _homeStore.selectType == 0
                            ? Icons.grid_view
                            : Icons.list,
                      ),
                      splashRadius: 20,
                      tooltip: _homeStore.selectType == 0
                          ? 'Visualizar em Grade'
                          : 'Visualizar em Lista',
                    ),
            ),
            Observer(
              builder: (_) => _homeStore.isSelected.isNotEmpty
                  ? IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.delete),
                      tooltip: 'Remover as Notas',
                      onPressed: () => _homeStore.removeItens(),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/AddNote',
              arguments: Note(
                id: -1,
                title: '',
                body: '',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                noteColor: CORES[0],
              ),
            );
          },
        ),
        body: Observer(
          builder: (_) {
            if (_homeStore.loadingNotes) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (_homeStore.notes.isEmpty && _homeStore.isSearch) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          bottom: 15,
                        ),
                        child: const Icon(
                          Icons.search_off_outlined,
                          color: Colors.white,
                          size: 120,
                        ),
                      ),
                      const Text(
                        'Nenhuma nota correspondente!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (_homeStore.notes.isEmpty) {
              return Center(
                child: const Text(
                  'Você não tem nenhuma nota ainda, crie uma!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            } else {
              return Padding(
                padding: _paddingForView(context),
                child: _homeStore.selectType == 0
                    ? ListView.separated(
                        itemCount: _homeStore.notes.length,
                        itemBuilder: (_, index) => NoteCard(
                          note: _homeStore.notes[index],
                          actionSelect: _homeStore.isSelected.isNotEmpty,
                        ),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 5,
                        ),
                      )
                    : StaggeredGridView.count(
                        crossAxisSpacing: 6,
                        crossAxisCount: _crossAxisCount(context),
                        mainAxisSpacing: 6,
                        children: _homeStore.notes
                            .map(
                              (element) => NoteCard(
                                note: element,
                                actionSelect: _homeStore.isSelected.isNotEmpty,
                              ),
                            )
                            .toList(),
                        staggeredTiles: _homeStore.notes
                            .map((element) => StaggeredTile.fit(1))
                            .toList(),
                      ),
              );
            }
          },
        ),
      );

  int _crossAxisCount(BuildContext context) {
    return MediaQuery.of(context).size.width > 600 ? 3 : 2;
  }

  EdgeInsets _paddingForView(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double padding;
    double topBottom = 8;
    if (width > 500) {
      padding = (width) * 0.05;
    } else {
      padding = 8;
    }
    return EdgeInsets.only(
      left: padding,
      right: padding,
      top: topBottom,
      bottom: topBottom,
    );
  }
}
