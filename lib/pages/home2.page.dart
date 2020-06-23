import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vou_de_excursao/widgets/excursions_list.dart';
import 'package:vou_de_excursao/widgets/menu.dart';
import '../widgets/destination_carousel.dart';


class TravelScreen extends StatefulWidget {
  final String nome;
  final String email;

  const TravelScreen({Key key, this.email, this.nome}) : super(key: key);

  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    Icons.beach_access,
    FontAwesomeIcons.ticketAlt,
    FontAwesomeIcons.shoppingBag,
    FontAwesomeIcons.utensils,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7BEE),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(nome: widget.nome, email: widget.email),
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
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'Para onde você quer ir?',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList()),
          SizedBox(
            height: 20,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 20,
          ),
          ExcursionsList(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        
        onTap:(int value){
          setState((){
            _currentTab = value; 
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, size: 30), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(Icons.email, size: 30), title: SizedBox.shrink()),
          
        ],
      ),
    );
  }
}
