import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:lokota/models/countries_model.dart';
import 'package:lokota/models/movie_model.dart';
import 'package:lokota/models/placeholder.dart';
import 'package:lokota/models/user_post.dart';
import 'package:lokota/models/weather_model.dart';
import 'package:lokota/pages/exchange_rate.dart';
import 'package:lokota/pages/jsonpalceholder.dart';
import 'package:lokota/pages/trending_movies.dart';

import 'models/album_model.dart';
import 'api_services.dart';
import 'models/coin_model.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ExchangeRateUI(),
      // TrendingMovieScreen()
      // JsonPlaceholder()

    );
  }
}














///my own get album function
// Future<Album> fetchAlbum() async{
//   String endpoint = 'https://jsonplaceholder.typicode.com/albums/1';
//   var uri = Uri.parse(endpoint);
//
//   var res = await http.get(uri);
//   if(res.statusCode == 200){
//     return Album.fromJson(jsonDecode(res.body));
//   }
//   else{
//     throw Exception('somethin went wrong');
//   }
//
//
// }


















