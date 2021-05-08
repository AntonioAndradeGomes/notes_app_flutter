import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Note {
  int id;
  String title, body;
  DateTime createdAt, updatedAt;
  Color noteColor;

  Note({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.noteColor,
  });

  factory Note.fromJson(Map<String, dynamic> data) => Note(
        id: data['id'],
        body: data['body'],
        title: data['title'],
        createdAt: DateTime.parse(data['createdAt']),
        updatedAt: DateTime.parse(data['updatedAt']),
        noteColor: Color(data['noteColor']),
      );

  Map<String, dynamic> toMap(bool update) {
    var map = {
      'body': this.body,
      'title': this.title,
      'createdAt': this.createdAt.toString(),
      'updatedAt': this.updatedAt.toString(),
      'noteColor': this.noteColor.value,
    };
    if (update) {
      map['id'] = this.id;
    }
    return map;
  }

  String get strLastModified =>
      DateFormat('dd/MM/yyyy HH:mm').format(updatedAt);
}
