
import 'package:flutter/material.dart';

import '../api_services.dart';
import '../models/countries_model.dart';
import 'package:http/http.dart' as http;

import '../models/user_post.dart';

class UserPostWidget extends StatefulWidget {
  const UserPostWidget({Key? key}) : super(key: key);

  @override
  State<UserPostWidget> createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends State<UserPostWidget> {

  ApiServices apiServices = ApiServices();

  late final  Future<List<UserPost>> fetchCountries;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountries = apiServices.getPosts(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('postyz'),),
      body: Center(
        child: FutureBuilder(
            future: fetchCountries ,
            builder: (context, snapshot){

              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index){
                      return  Unique(userPost: snapshot.data![index]);
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


class Unique extends StatelessWidget {
  final  UserPost userPost;
  const  Unique({
    required  this.userPost, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            userPost.title
        ),
        SizedBox(height: 10,),
        Text(
            userPost.body
        ),

      ],
    );
  }
}
