import 'package:flutter/material.dart';

import 'package:notes_sqlite_mobx/consts.dart';
import 'package:notes_sqlite_mobx/models/Note.dart';
import 'package:notes_sqlite_mobx/screens/addNote/add_note.dart';
import 'package:notes_sqlite_mobx/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: CORES[0],
        scaffoldBackgroundColor: CORES[0],

        appBarTheme: AppBarTheme(
          elevation: 0,
          // backwardsCompatibility: false,
          backgroundColor: CORES[0],
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/AddNote':
            return MaterialPageRoute(
                builder: (_) => AddNote(settings.arguments as Note));
          case '/':
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
    );
  }
}
