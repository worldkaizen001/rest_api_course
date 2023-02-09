import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/placeholder.dart';
import 'package:http/http.dart' as http;

class JsonPlaceholder extends StatefulWidget {
  const JsonPlaceholder({Key? key}) : super(key: key);

  @override
  State<JsonPlaceholder> createState() => _JsonPlaceholderState();
}

class _JsonPlaceholderState extends State<JsonPlaceholder> {

  String cart = 'https://catfact.ninja/fact';

  Future<List<JsonData>> getJson() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var res = await http.get(uri);
    if(res.statusCode == 200){
      var data = json.decode(res.body);

      return data == null ? [] : List.from(data.map(JsonData.fromJson));


    }
    else{
      throw Exception('error thrown');
    }

  }
  late final  Future<List<JsonData>> fetchJsonPost;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchJsonPost = getJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          getJson();

        }),
        appBar: AppBar(title: const Text('JsonPlaceholder'),),
        body: Center(
          child: FutureBuilder<List<JsonData>>(
            future: fetchJsonPost,
            builder: (context, snapshot){

              if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }
              else if(snapshot.hasData){
                var  data = snapshot.data;
                print(data);

                return ListView.builder(
                    itemCount: snapshot.data!.length,

                    itemBuilder: (_,index){
                      return Text(snapshot.data![index].body);
                    });
              }
              else{
                return Text('${snapshot.error}');

              }

            } ,
          ),
        ));
  }

}