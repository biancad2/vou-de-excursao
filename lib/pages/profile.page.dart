import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vou_de_excursao/pages/profile_edit.dart';
import '../models/destination_model.dart';

class Profile extends StatefulWidget {
  final String email;
  final String nome;

  const Profile({this.email, this.nome});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back, color: Colors.white), onTap: (){Navigator.pop(context);},),
        title: Text("Perfil", style: TextStyle(color: Colors.white)),
        elevation: 1,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 7),
                  child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/pessoa.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 38),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.nome,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.location_on,
                                  color: Colors.white, size: 17),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Santos - SP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    wordSpacing: 2,
                                    letterSpacing: 4,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 38, left: 38, top: 15, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        Text('followers', style: TextStyle(color: Colors.white)),
                      ]),
                  Container(
                    color: Colors.white,
                    width: 0.2,
                    height: 22,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        Text('following', style: TextStyle(color: Colors.white)),
                      ]),
                  Container(
                    color: Colors.white,
                    width: 0.2,
                    height: 22,
                  ),
                  Container(
                   
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(33)),
                        border: Border.all(
                            width: 2.0, color: const Color(0xFFFFFFFF))),
                    child: FlatButton(
                       padding:
                        EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
                        child: Text(
                        "Editar",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: (

                      ){
                        return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditProfile(email: widget.email, nome: widget.nome),
                  ));
                      }
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(34))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 33,
                        ),
                        child: Text(
                          "Sobre",
                          style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 25, top: 20),
                        child: Column(children: <Widget>[
                          Row(
              children: <Widget>[
                Icon(Icons.home, size: 20),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Mora em Santos - SP",
                  style: TextStyle(fontSize: 15),
                ),
              ],
                          ),
                          SizedBox(
              height: 15,
                          ),
                          Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.suitcase, size: 20),
                SizedBox(
                  width: 10,
                ),
                Text("É um viajante iniciante",
                    style: TextStyle(fontSize: 15)),
              ],
                          ),
                          SizedBox(
              height: 15,
                          ),
                          Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.instagramSquare, size: 20),
                SizedBox(
                  width: 10,
                ),
                Text("@user", style: TextStyle(fontSize: 15)),
              ],
                          ),
                        ]),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 20,
                          bottom: 5,
                        ),
                        child: Row(
                          children: <Widget>[
              Icon(FontAwesomeIcons.globe, size: 15, color: Colors.grey),
              SizedBox(width: 15),
              Text(
                "Viagens feitas",
                style:
                    TextStyle( fontSize: 16, color: Colors.grey),
              ),
                          ],
                        ),
                      ),
                      Container(
                          child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  primary: false,
                   physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index) {
                    Destination destination = destinations[index];
                    return Container(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                        child: Image.asset(destination.imageUrl,
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int count) {
                    return StaggeredTile.count(
                        2, count.isEven ? 3 : 1);
                  },
                  
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  
                ),
              ),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
