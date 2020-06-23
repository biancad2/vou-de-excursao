import 'package:flutter/material.dart';
import 'package:vou_de_excursao/pages/login.page.dart';
import 'package:vou_de_excursao/pages/my_excursions.dart';
import 'package:vou_de_excursao/pages/profile.page.dart';
import '../pages/home2.page.dart';

class Menu extends StatefulWidget {
  final String email;
  final String nome;

  const Menu({Key key, this.email, this.nome}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
       child: GestureDetector(
         onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Profile(email: widget.email, nome: widget.nome),
                  ),
                ),
                child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  widget.nome, style: TextStyle(color: Colors.white, letterSpacing: 1.2),
                ),
                accountEmail: Text(widget.email, style: TextStyle(color: Colors.white, letterSpacing: 1.2)),
                currentAccountPicture: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("images/pessoa.png"),
                  backgroundColor: Colors.transparent,
                ),
               
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Página inicial'),
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TravelScreen(email: widget.email, nome: widget.nome),
                        ),
                      );
                },
              ),
              ListTile(
                leading: Icon(Icons.directions_bus),
                title: Text('Viagens feitas'),
                onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyExcursions(email: widget.email, nome: widget.nome),
                        ),
                      );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings_power),
                title: Text('Sair'),
                onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                },
              ),
               
              new Divider(),
              ListTile(
                title: Text('Termos de uso e Política de privacidade'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Central de ajuda'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
      ),
       ),
    );
  }
}