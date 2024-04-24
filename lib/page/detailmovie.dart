import 'package:etspbb/db/movie_databases.dart';
import 'package:etspbb/model/moviedb.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  int id =1;

  const Home({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Movie movie;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    movie = await MovieDatabase.instance.readMovie(widget.id);

    setState(() => isLoading = false);
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
      FloatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child:const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddEditNotePage()),
          );
        },
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