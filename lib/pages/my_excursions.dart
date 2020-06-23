import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vou_de_excursao/models/activity_model.dart';
import 'package:vou_de_excursao/widgets/menu.dart';
import '../models/activity_model.dart';
import '../models/destination_model.dart';
import 'package:flutter/material.dart';

class MyExcursions extends StatefulWidget {

   final String email;
  final String nome;


  const MyExcursions({Key key, this.email, this.nome}) : super(key: key);
  @override
  _MyExcursionsState createState() => _MyExcursionsState();
}

class _MyExcursionsState extends State<MyExcursions> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(email: widget.email, nome: widget.nome),
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
              hintText: "Pesquisar...",
              hintStyle: new TextStyle(color: Colors.grey)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.keyboard_voice),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 25)),
          Expanded(

            child: ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 15),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                 
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 120,
                                      child: Text(
                                        "Excursão",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          '\$120',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'per pax',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("Categoria",
                                    style: TextStyle(color: Colors.grey)),
                                _buildRatingStars(5),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text('22:00'),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text('12:00'),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            width: 110,
                            image: AssetImage('images/travels/saopaulo.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
