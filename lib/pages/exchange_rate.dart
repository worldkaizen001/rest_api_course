

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lokota/api_services.dart';

import '../models/rate_period.dart';


class ExchangeRateUI extends StatefulWidget {
  const ExchangeRateUI({Key? key}) : super(key: key);

  @override
  State<ExchangeRateUI> createState() => _ExchangeRateUIState();
}

class _ExchangeRateUIState extends State<ExchangeRateUI> {

ApiServices apiServices = ApiServices();
  late final Future<List<RatePeriod>> fetchRate;

  String reverseName(String name){
    return name.split('').reversed.join('');
  }

  num getSum (a, b) => a + b;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRate = apiServices.getPeriod(http.Client());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<RatePeriod>>(
          future: fetchRate,
            builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                  return Column(
                    children: [
                      Text(snapshot.data![index].displayName),
                      Text('this is unit name ${snapshot.data![index].unitName}'),
                      Text('this is unit name ${snapshot.data![index].periodId}'),
                      ElevatedButton(onPressed: (){
                       var check = reverseName('kelvin');
                       print(check);
                       var sum = getSum(2, 4);
                       print(sum);
                      }, child: Text('reverse'))

                    ],
                  );
                  });
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            else{
              return Text('somehing is wrong');
            }
            }),
      ),
    );
  }
}
