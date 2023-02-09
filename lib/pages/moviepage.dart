
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_services.dart';
import '../main.dart';
import '../widget/movie_widget.dart';

class MoviePage extends ConsumerWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movieCall = ref.watch(getmovies);
    return Scaffold(
      body: Center(
        child: movieCall.when(data: (data){
          return MovieWidget(movieData: data,);
        }, error: (error, _){
          return Text(error.toString());
        }, loading: (){
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
