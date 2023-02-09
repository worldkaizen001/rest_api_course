



import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

class MovieWidget extends StatelessWidget {
  final MovieData movieData;
  const MovieWidget({required this.movieData,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(movieData.title),
        Text(movieData.budget.toString()),
        Text(movieData.overview),
      ],
    );
  }
}
