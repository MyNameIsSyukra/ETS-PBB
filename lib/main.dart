import 'package:flutter/material.dart';
import 'package:etspbb/page/home.dart';
import 'package:etspbb/page/detailmovie.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes : {
    '/home': (context) => Home(),
    // '/detailmovie': (context) => DetailMovie(),
}
));


