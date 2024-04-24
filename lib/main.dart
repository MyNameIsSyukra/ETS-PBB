import 'package:flutter/material.dart';
import 'package:etspbb/page/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes : {
    '/home': (context) => Home(),
}
));


