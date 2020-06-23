import 'package:flutter/material.dart';
import './pages/login.page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vou de excursão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1)
      ),
      home: LoginPage(),
    );
  }
}


