import 'package:etspbb/db/movie_databases.dart';
import 'package:etspbb/model/moviedb.dart';
import 'package:etspbb/page/detailmovie.dart';
import 'package:etspbb/widget/movie_card_widget.dart';
import 'package:etspbb/page/editnotepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Movie> movies;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    movies = await MovieDatabase.instance.readAllMovies();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title: Text('MoviesApp', style: TextStyle(
              color: Colors.white,),),
            centerTitle: true,
            backgroundColor: Colors.black
        ),
        body: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Center(
                      child: Image.network(
                          'https://picsum.photos/200/300/?blur'),
                    )),
                SizedBox(height: 20,),
                Text('Title', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                Divider(
                  height: 20,
                  color: Colors.white,
                ),
                Text('ini deskripsi', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() =>
      StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: List.generate(
            movies.length,
                (index) {
              final note = movies[index];

              return StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailMovie(movieId: note.id!),
                    ));
                  },
                  child: NoteCardWidget(note: note, index: index),
                ),
              );
            },
          ));
}