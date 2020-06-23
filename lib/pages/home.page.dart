import 'package:flutter/material.dart';
import '../widgets/bottom-navigation.dart';
import '../widgets/menu.dart';
import 'my_excursions.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  bool isSearchEnabled = true;

  _switchSearchBarState() {
    setState(() {
      isSearchEnabled = !isSearchEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        elevation: 1,
        iconTheme: new IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: TextField(
          style: new TextStyle(
            color: Colors.white,
          ),
          decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              hintStyle: new TextStyle(color: Colors.grey)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _switchSearchBarState,
          ),
          IconButton(
            icon: Icon(Icons.keyboard_voice),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyExcursions(),
                      ),
                    );
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationMenu(),
    );
  }
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://baltaio.blob.core.windows.net/student-images/1edd5c50-bae9-11e8-8eb4-39de303632c1.jpg"),
          ),
          title: Text("Bruce Wayne"),
          subtitle: Text("09/05/2019 18:37"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          child: Image.asset("images/post-picture-001.png"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi. "),
        ),
        ButtonTheme.bar(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.favorite),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
