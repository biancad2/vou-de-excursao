import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vou_de_excursao/models/activity_model.dart';
import 'package:vou_de_excursao/pages/carousel_screen2.dart';
import 'package:vou_de_excursao/pages/home2.page%20copy.dart';
import 'package:vou_de_excursao/widgets/menu.dart';
import '../models/activity_model.dart';
import '../models/destination_model.dart';
import 'package:flutter/material.dart';
import '../models/hotel_model.dart';

class ExcursionsList extends StatelessWidget {


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
              Text('Excursões bate-volta',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
            
            ],
          ),
        ),

        //Lista dos lugares
        Container(
         
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
                  primary: false,
                   
            scrollDirection: Axis.vertical,
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
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                
                                
                                Padding(
                                  padding: const EdgeInsets.only(left: 120),
                                  child: Text(
                                    destination.title,
                                    
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120),
                                  child: Text(
                                    destination.description,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      
                                      fontSize: 13
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 6),
                               
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: Row(children: <Widget> [
                                        Icon(Icons.group, size: 10, color: Colors.grey),
                                        SizedBox(width: 2),
                                        Text(destination.vacancies.toString() + " vagas",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey
                                        ))
                                      ]),
                                    ),
                                    SizedBox(
                                  height: 6,
                                ),
                                     Padding(
                                   padding: const EdgeInsets.only(left: 120),
                                  child: Text('R\$' + destination.price.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        
                                      )),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            height: 120,
                            width: 120,
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
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
