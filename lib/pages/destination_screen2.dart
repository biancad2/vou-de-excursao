import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vou_de_excursao/models/activity_model.dart';
import '../models/images_model.dart';
import '../models/destination_model.dart';
import 'package:flutter/material.dart';

class DestinationScreen2 extends StatefulWidget {
  final Destination destination;

  DestinationScreen2({this.destination});
  @override
  _DestinationScreen2State createState() => _DestinationScreen2State();
}

class _DestinationScreen2State extends State<DestinationScreen2> {
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
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 25)),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2),
                            blurRadius: 6)
                      ]),
                  child: Hero(
                    tag: widget.destination.imageUrl,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.destination.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        ImageDescription image =
                            widget.destination.images[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: AssetImage(image.description),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 25,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.sortAmountDown),
                            iconSize: 25,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ])
                      ]),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.destination.city,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.locationArrow,
                                size: 15, color: Colors.white70),
                            SizedBox(width: 5),
                            Text(
                              widget.destination.country,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 20),
                            ),
                          ],
                        ),
                      ]),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child:
                      Icon(Icons.location_on, color: Colors.white70, size: 25),
                ),
              ],
            ),
          ),
          Container(
            child: Text("Teste"),
          )
        ],
      ),
    );
  }
}
