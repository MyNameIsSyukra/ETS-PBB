import 'package:flutter/material.dart';
import 'package:etspbb/db/movie_databases.dart';
import 'package:etspbb/model/moviedb.dart';
import 'package:etspbb/widget/movie_card_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Movie? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {

}