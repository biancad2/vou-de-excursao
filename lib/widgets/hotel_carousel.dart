import 'package:flutter/material.dart';
import '../models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key key}) : super(key: key);

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
              Text('Exclusive Hotels',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              GestureDetector(
                onTap: () => print('See all'),
                child: Text('See All',
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
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];

              //Descrição do local
              return Container(
                margin: EdgeInsets.all(10),
                width: 260,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120,
                        width: 240,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                hotel.name,
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                hotel.address,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text('\$${hotel.price} /night',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ))
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          height: 180,
                          width: 240,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
