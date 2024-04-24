import 'package:etspbb/db/movie_databases.dart';
import 'package:etspbb/model/moviedb.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            Divider(
              height: 60,
              color: Colors.white,
            ),
            Text('Welcome to MoviesApp',style: TextStyle(
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