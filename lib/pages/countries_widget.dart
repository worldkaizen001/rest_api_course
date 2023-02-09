
import 'package:flutter/material.dart';

import '../api_services.dart';
import '../models/countries_model.dart';
import 'package:http/http.dart' as http;

class CountriesWidget extends StatefulWidget {
  const CountriesWidget({Key? key}) : super(key: key);

  @override
  State<CountriesWidget> createState() => _CountriesState();
}

class _CountriesState extends State<CountriesWidget> {
  ApiServices apiServices = ApiServices();

  late final  Future<List<Countries>> fetchCountries;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountries = apiServices.getCountries(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Countries>>(
            future: fetchCountries ,
            builder: (context, snapshot){

              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index){
                      return Text(
                          snapshot.data![index].name.common
                      );
                    });
              }
              else if (snapshot.hasError){
                return Text('${snapshot.error.toString()}');
              }
              else{
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}