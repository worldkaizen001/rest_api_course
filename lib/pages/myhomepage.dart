

import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Weather> getWeather() async {
    var apiKey = 'bfcd3b7bfd48fdd218615ed7eb7ec7aa';
    String endpoint = 'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$apiKey';
    var uri = Uri.parse(endpoint);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      print(jsonDecode(response.body));

      return  Weather.fromJson(json.decode(response.body));


    }
    else{
      throw Exception('something wrong');
    }
  }

  late final  Future<Weather> weatherCall;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherCall = getWeather();
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        title: const Text('interview'),
      ),
      body: Center(

          child: FutureBuilder<Weather>(
              future: weatherCall,
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                } else if(snapshot.hasData){
                  var data = snapshot.data?.name;
                  var data2 = snapshot.data?.timezone;
                  var dat3 = snapshot.data?.base;
                  var dat4 = snapshot.data?.wind;
                  var dat5 = snapshot.data?.base;
                  return Column(
                    children: [
                      Text(data.toString()),
                      Text(data2.toString()),
                      Text(dat3.toString()),
                      Text(dat4!.gust.toString()),
                      Text(dat5.toString()),

                    ],
                  );
                }
                else{
                  return const Text('error occured');
                }
              })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getWeather();
          print('tapped');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
