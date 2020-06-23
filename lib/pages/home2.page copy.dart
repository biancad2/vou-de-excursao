import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/hotel_carousel.dart';
import '../widgets/destination_carousel.dart';
import '../widgets/bottom-navigation.dart';
import '../widgets/menu.dart';

class TravelScreen extends StatefulWidget {
 
  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return Scaffold(
     
      body: GestureDetector(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'What would you like to find?',
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
          HotelCarousel()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30), title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza, size: 30),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 15, backgroundImage: AssetImage('images/pessoa.png')),
              title: SizedBox.shrink()),
        ],
      ),
    );
  }
}
