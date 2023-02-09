

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_services.dart';

class PoodFuture extends ConsumerWidget {
  const PoodFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(getcoinData);
    return Scaffold(
        body: Center(
          child:  data.when(data: (sum){
            return  Column(
              children: [
                Text(sum.assetIdBase),
                Text(sum.time.weekday.toString()),
              ],
            );

          }, error: (error, _){
            return   Text(error.toString());
          }, loading: (){
            return  CircularProgressIndicator();
          }) ,
        )
    );
  }
}
