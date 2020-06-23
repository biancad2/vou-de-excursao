import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vou_de_excursao/widgets/images_description.dart';
import '../models/images_model.dart';
import '../models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselScreen extends StatefulWidget {
  final Destination destination;

  CarouselScreen({this.destination});

  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  Text _buildRateDestination(double rate) {
    String classification = '';
    if (rate >= 6) {
      classification = "Bom";
    } else {
      if (rate < 6 && rate >= 5) {
        classification = "Razoável";
      } else {
        classification = "Ruim";
      }
    }
    return Text(
      classification,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
final descTextStyle = TextStyle(
  color: Colors.grey[600],
  fontFamily: 'Roboto',

);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 24)),
              ImagesCarousel(destination: widget.destination),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.destination.title,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                "R\$" + widget.destination.price.toString(),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 50)),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(Icons.group, color: Colors.grey),
                              ),
                              Text(
                                  widget.destination.vacancies.toString() +
                                      " vagas",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 15, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Descrição",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Text(
                              widget.destination.description,
                              style: TextStyle(fontSize: 15, height: 1.5),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () => print('See all'),
                                  child: Text('VER MAIS',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 15, 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Avaliação",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 10,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                decoration: BoxDecoration(
                                    color: (widget.destination.rate >= 6)
                                        ? Colors.green
                                        : ((widget.destination.rate < 6 &&
                                                widget.destination.rate >= 5)
                                            ? Colors.yellow[800]
                                            : Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.destination.rate.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                              ),
                              _buildRateDestination(widget.destination.rate),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Opiniões",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                          cardItem(),
                          Divider(),
                          cardItem(),
                          Divider(),
                          cardItem(),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () => print('See all'),
                                child: Text('VER MAIS',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 15, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Comodidades",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                           

                           Row(
                             
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                 children: [
                                   Icon(Icons.wifi, size: 16,  color: Colors.grey[600],),
                                   Padding(padding: EdgeInsets.only(left: 5)),
                                   Text("Ônibus com wi-fi", style: descTextStyle,),
                                 ],
                               ),
                                SizedBox(
                              height: 15,
                            ),
                                Row(
                                 children: [
                                   Icon(Icons.fastfood, size: 16,  color: Colors.grey[600],),
                                   Padding(padding: EdgeInsets.only(left: 5)),
                                   Text("Café da manhã", style: descTextStyle),
                                 ],
                               ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                             Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                 children: [
                                   Icon(Icons.beach_access, size: 16,  color: Colors.grey[600],),
                                   Padding(padding: EdgeInsets.only(left: 5)),
                                   Text("Passeio pelas praias", style: descTextStyle),
                                 ],
                               ),
                                SizedBox(
                              height: 15,
                            ),
                                Row(
                                 children: [
                                   Icon(Icons.hotel, size: 16,  color: Colors.grey[600],),
                                   Padding(padding: EdgeInsets.only(left: 5)),
                                   Text("Hospedagem incluida", style: descTextStyle ),
                                 ],
                               ),
                              ],
                            ),
                               
                             ],
                           ),
                          
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             
              Padding(padding: EdgeInsets.only(bottom: 20)),
              RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                child: Container(
                    color: Colors.blue,
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Reservar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                child: Container(
                    color: Colors.blue,
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Enviar mensagem",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardItem() {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://baltaio.blob.core.windows.net/student-images/1edd5c50-bae9-11e8-8eb4-39de303632c1.jpg"),
          ),
          title: Text("Bruce Wayne"),
          subtitle: Text("09/05/2019 18:37"),
        ),
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5),
              ),
              Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
              ),
              Text(
                "Muito bom",
                style: TextStyle(color: Colors.grey),
              )
            ])),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi. "),
        ),
      ],
    ),
  );
}
