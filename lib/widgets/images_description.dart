import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../models/destination_model.dart';

class ImagesCarousel extends StatefulWidget {
  
  final Destination destination;

  ImagesCarousel({this.destination});
  @override
  _ImagesCarouselState createState() => _ImagesCarouselState();
}

class _ImagesCarouselState extends State<ImagesCarousel> {
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
              child: Stack(children: <Widget>[
                SizedBox(
                    height: 350,
                    width: width,
                    child: Carousel(
                      boxFit: BoxFit.fill,
                      images: widget.destination.images
                          .map((pic) => new AssetImage(pic.description))
                          .toList(),
                      dotBgColor: Colors.transparent,
                      dotIncreaseSize: 1.5,
                      dotColor: Colors.grey,
                      dotIncreasedColor: Colors.white,
                      animationDuration: Duration(milliseconds: 1000),
                      autoplay: false,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.share),
                            iconSize: 25,
                            color: Colors.white,
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.heart),
                            iconSize: 25,
                            color: Colors.white,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ])
                      ]),
                ),
              ]),
            );
  }
}
