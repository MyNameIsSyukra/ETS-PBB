import 'package:etspbb/db/movie_databases.dart';
import 'package:etspbb/model/moviedb.dart';
import 'package:flutter/material.dart';



class Main extends StatefulWidget {
  @override
  State<Main> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<Main> {
  late Movie movie;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: Text('MoviesApp',style: TextStyle(
            color: Colors.white,),),
          centerTitle: true,
          backgroundColor: Colors.black
      ),
      body: Padding(
          padding: EdgeInsets.all(30.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child:Center(
                    child:Image.network('https://picsum.photos/200/300/?blur'),
                  )),
              SizedBox(height: 20,),
              Text('Title',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              Divider(
                height: 20,
                color: Colors.white,
              ),
              Text('ini deskripsi',style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ],
          )
      ),
    );
  }
}