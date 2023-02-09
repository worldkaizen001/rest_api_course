

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokota/models/placeholder.dart';
import 'package:lokota/models/trending_movie_model.dart';
import 'package:lokota/models/user_post.dart';

import 'models/coin_model.dart';
import 'package:http/http.dart' as http;

import 'models/countries_model.dart';
import 'models/movie_model.dart';
import 'models/rate_period.dart';


final getcoinData = FutureProvider<CoinData>((ref) async{
  var serve = ref.watch(apiService);
  return serve.getCoins(http.Client());
});
final getmovies = FutureProvider<MovieData>((ref) async{
  var serve = ref.watch(apiService);
  return serve.getMovies();
});

final getTrending = FutureProvider<List<TrendingMovieData>>((ref) async {
  var server = ref.watch(apiService);
  return server.getTrendingMovies();
});

final apiService = Provider<ApiServices>((ref) {
  return ApiServices();
});

class ApiServices {

  String moviedbKey = 'c079f0fc6602568664bd4fffc27c97b5';

  num sumAll(a, b) => a+b;

  Future<JsonData> getJson(http.Client client) async {

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var res = await client.get(uri);
    if(res.statusCode == 200){
      var data = json.decode(res.body);

      return JsonData.fromJson(data);
    }

    else{
      throw Exception('something went wrong');
    }
  }


  Future<CoinData> getCoins(http.Client client) async {
    String endpoint = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';
    var uri = Uri.parse(endpoint);
    var respo = await client.get(uri,headers: {
      'X-CoinAPI-Key': '2B8796CE-74ED-4550-A853-170D0B343899',
    });
    if(respo.statusCode == 200){
      print(respo.body);
      return CoinData.fromJson(json.decode(respo.body));
    }
    else{
      throw Exception('som wrong');
    }

  }

  Future<MovieData> getMovies () async {
    String endpoint = 'https://api.themoviedb.org/3/movie/3?api_key=$moviedbKey&language=en-US';
    var uri = Uri.parse(endpoint);
    var resp = await http.get(uri);
    if(resp.statusCode == 200){
      return MovieData.fromJson(jsonDecode(resp.body));
    }
    else{
      throw Exception('something wrong');
    }
  }

  Future<List<TrendingMovieData>> getTrendingMovies( )async{
   var endpoint = 'https://api.themoviedb.org/3/trending/all/day?api_key=$moviedbKey';

   var uri = Uri.parse(endpoint);
   var  res = await http.get(uri);
 if(res.statusCode == 200){
   var data = jsonDecode(res.body);

   return data == null ? [] : List.from(data.map(TrendingMovieData.fromJson));
 }
 else{
   throw Exception('Something went wrong');
 }

  }

  Future<dynamic> postAllJsonData (Object val1,Object var2, Object val3) async {

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var body = {
                    "userId": val1,
                    "title": var2,
                       "body": val3,

    };

    var res = await http.post(uri,body: body);
    if(res.statusCode == 201){
      print(res.body);

    }
    else {
      throw Exception('Could not post data');
    }


  }


  Future<List<Countries>> getCountries (http.Client client) async {

    var res = await client.get(Uri.parse('https://restcountries.com/v3.1/name/nigeria'));
    if(res.statusCode == 200){

      var data = json.decode(res.body);
      return data == null ? [] : List.from(data.map(Countries.fromJson));
    }else{
      throw Exception('Something went wrong');
    }
  }


  Future<List<UserPost>> getPosts (http.Client client) async {

    var res = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(res.statusCode == 200){

      var data = json.decode(res.body);
      print(data);
      return data == null ? [] : List.from(data.map(UserPost.fromJson));
    }else{
      throw Exception('Something went wrong');
    }
  }

  Future<List<RatePeriod>> getPeriod (http.Client client) async {

    String endpoint = 'https://rest.coinapi.io/v1/exchangerate/history/periods';

    var uri = Uri.parse(endpoint);
    var respo = await client.get(uri,headers: {
      'X-CoinAPI-Key': '2B8796CE-74ED-4550-A853-170D0B343899',
    });
    if(respo.statusCode == 200){
      print(respo.body);
      var data = jsonDecode(respo.body);
      return data == null ? []: List.from(data.map(RatePeriod.fromJson));
    }
    else{
      throw Exception('som wrong');
    }
  }




}