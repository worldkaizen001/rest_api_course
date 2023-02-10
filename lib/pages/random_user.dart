

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/random_user_model.dart';


class RandomUser extends StatefulWidget {
  const RandomUser({Key? key}) : super(key: key);

  @override
  State<RandomUser> createState() => _RandomUserState();
}

class _RandomUserState extends State<RandomUser> {

  Future<RandomUserModel> getRandomUser () async {
    String endpoint = 'https://random-data-api.com/api/v2/users';
    var uri = Uri.parse(endpoint);

    var response = await http.get(uri);
   if(response.statusCode == 200) {
     print(response.body);
     var data = jsonDecode(response.body);
     return RandomUserModel.fromJson(data);
   }
   else{
     return throw Exception('som wen wrong');
   }
  }

  late final Future<RandomUserModel> fetchRandom;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRandom = getRandomUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchRandom,
            builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if (snapshot.hasData){
              return Column(
                children: [
                  Text(snapshot.data!.employment.title),
                  Text(snapshot.data!.lastName),
                  Image.network(snapshot.data!.avatar,height: 100,width: 100,)
                ],
              );
            }
            else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }

            else{
              return Text('Omo');
            }
            }),
      ),
    );
  }
}
