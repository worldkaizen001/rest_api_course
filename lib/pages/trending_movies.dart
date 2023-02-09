

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_services.dart';
import '../models/trending_movie_model.dart';

class TrendingMovieScreen extends StatefulWidget {
  const TrendingMovieScreen({Key? key}) : super(key: key);

  @override
  State<TrendingMovieScreen> createState() => _TrendingMovieScreenState();
}

class _TrendingMovieScreenState extends State<TrendingMovieScreen> {
  ApiServices apiServices = ApiServices();

  late final Future<List<TrendingMovieData>> fetchTrending;

  @override
  void initState() {
    // TODO: implement initState
    fetchTrending = apiServices.getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List<TrendingMovieData>>(
          future: fetchTrending,
            builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (_, index){
                    return Column(
                      children: [
                        Text(snapshot.data![index].page.toString()),
                      ],
                    );
                  }
              );
            }
            else if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'));
            }
            else{
              return CircularProgressIndicator();
            }
            }),
      )
      // Center(
      //   child: trendData.when(data: (data){
      //     var result = data[];
      //
      //     return Text(result.toString());
      //   }, error: (error, _){
      //     return Text(error.toString());
      //   }, loading: (){
      //     return CircularProgressIndicator();
      //   }),
      // ),
    );
  }
}
