import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/coin_model.dart';
import '../models/placeholder.dart';
import 'package:http/http.dart' as http;

class CoinEndPoint extends StatefulWidget {
  const CoinEndPoint({Key? key}) : super(key: key);

  @override
  State<CoinEndPoint> createState() => _CoinEndPointState();
}

class _CoinEndPointState extends State<CoinEndPoint> {

  Future<CoinData> getCoins ()async {
    String endpoint = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';
    var uri = Uri.parse(endpoint);
    var respo = await http.get(uri,headers: {
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

  late final Future<CoinData> getcoonCall;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcoonCall = getCoins();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<CoinData>(
            future: getcoonCall,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Column(
                    children: [
                      Text(snapshot.data!.assetIdBase),
                      Text(snapshot.data!.rate.toString()),
                      Text(snapshot.data!.time.toLocal().toIso8601String()),

                    ]
                );
              }
              else if(snapshot.hasError){
                return Text(snapshot.error.toString());

              }
              else{
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}