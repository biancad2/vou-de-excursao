import 'images_model.dart';
import 'activity_model.dart';

class Destination {
  String imageUrl;
  String title;
  String city;
  String country;
  String description;
  int vacancies;
  double rate;
  double price;
  List<Activity> activities;
  List<ImageDescription> images;

  Destination({
    this.imageUrl,
    this.title,
    this.city,
    this.country,
    this.description,
    this.vacancies,
    this.rate,
    this.price,
    this.activities,
    this.images,
  });
}

List<ImageDescription> images = [
  ImageDescription(
    description: 'images/travels/saopaulo.jpg',
  ),
   ImageDescription(
    description: 'images/travels/paris.jpg',
  ),
   ImageDescription(
    description: 'images/travels/venice.jpg',
  )
];

List<Activity> activities = [
  Activity(
    imageUrl: 'images/travels/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'images/travels/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'images/travels/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'images/travels/venice.jpg',
    title: "Teste titulo",
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    vacancies: 35,
    rate: 10,
    price: 120.30,
    activities: activities,
    images: images,
  ),
  Destination(
    imageUrl: 'images/travels/paris.jpg',
    title: "Excursão Torre Eifel",
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    vacancies: 35,
    rate: 6,
    price: 155,
    activities: activities,
    images: images,
  ),
  Destination(
    imageUrl: 'images/travels/newdelhi.jpg',
    title: "Excursão",
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    vacancies: 35,
    rate: 3.5,
    price: 120.30,
    activities: activities,
    images: images,
  ),
  Destination(
    imageUrl: 'images/travels/saopaulo.jpg',
    title: "Excursão pontos turísticos",
    city: 'São Paulo',
    country: 'Brasil',
    description: 'Promoção para reservas efetuadas HOJE 399,00 por pessoa Capitólio - 18 a 20 de Setembro  Incluso: \n- Transporte em ônibus executivo Style Bus (WiFi - cortesia, Dvd, Ar, Wc, frigobar); \n- Hospedagem em hotel, disponibilidade de quartos para casal / duplos /triplos no centro de Passos - uma cidade cheia de barzinhos, baladas e restaurantes para vc curtir a melhor vida noturna da região. \n- Café da manhã de sábado e domingo; \n- Traslado para mirante* (ingresso a parte) \n- Mirante de Furnas \n- Traslado para passeio de catamarã/lancha pelos cânions* (ingresso pago a parte)',
    vacancies: 35,
    rate: 5,
    price: 120.30,
    activities: activities,
    images: images,
  ),
  Destination(
    imageUrl: 'images/travels/newyork.jpg',
    title: "Excursão calçada da fama",
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    vacancies: 35,
    rate: 8,
    price: 120.30,
    activities: activities,
    images: images,
  ),
];
