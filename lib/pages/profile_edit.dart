import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vou_de_excursao/pages/profile.page.dart';
import '../models/destination_model.dart';

class EditProfile extends StatefulWidget {
  final String email;
  final String nome;

  const EditProfile({this.email, this.nome});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Editar", style: TextStyle(color: Colors.white)),
        elevation: 1,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          Profile(email: widget.email, nome: widget.nome),
                    ));
              },
              child: Icon(
                Icons.save,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('images/pessoa.png')),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.black38,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Icon(Icons.image, color: Colors.white)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        child: TextFormField(
                          
                          initialValue: widget.nome,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Nome",
                            hintStyle: TextStyle(color: Colors.white38),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
                            contentPadding: EdgeInsets.only(left: 65),
                            
                          ),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Container(
                 height: 500,
                 width: double.infinity,
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 33),
                      ),
                    ),
                    
                   
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
