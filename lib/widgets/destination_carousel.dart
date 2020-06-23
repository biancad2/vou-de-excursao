import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:vou_de_excursao/pages/destination_screen.dart';
//import 'package:vou_de_excursao/pages/destination_screen2.dart';
//import 'package:vou_de_excursao/pages/carousel_screen.dart';
import 'package:vou_de_excursao/pages/carousel_screen2.dart';
import '../models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // Título e ver todos
            children: <Widget>[
              Text('Mais populares',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              GestureDetector(
                onTap: () => print('See all'),
                child: Text('Ver Todos',
                    style: TextStyle(
                        color: Color(0xFF2ECCFA),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1)),
              )
            ],
          ),
        ),

        //Lista dos lugares
        Container(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];

              //Descrição do local
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CarouselScreen(destination: destination),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 155,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 20,
                        child: Container(
                          height: 200,
                          width: 155,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  destination.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  destination.title,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(destination.rate.toString()),
                                          Icon(Icons.star, size: 13),
                                        ],
                                      ),
                                      
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("R\$ " +
                                          destination.price.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //Imagem do lugar
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 150,
                                  width: 150,
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(FontAwesomeIcons.locationArrow,
                                            size: 10, color: Colors.white),
                                        SizedBox(width: 5),
                                        Text(
                                          destination.country,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
