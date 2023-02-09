
import 'package:flutter/material.dart';

import '../api_services.dart';

class PostToJson extends StatelessWidget {
  const PostToJson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController val1 = TextEditingController();
    TextEditingController val2 = TextEditingController();
    TextEditingController val3 = TextEditingController();
    ApiServices apiServices = ApiServices();
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: val1,
          ),
          TextFormField(
            controller: val2,
          ),
          TextFormField(
            controller: val3,
          ),

          const SizedBox(height: 150,),
          ElevatedButton(onPressed: () async{
            apiServices.postAllJsonData(val1.text, val2.text, val3.text).then((value) {
              print(' we don navigate o');
              Future.delayed(Duration(seconds: 5), (){
                print(' we dey roll up so');
              });
            });

          }, child: const Text('Post data'))


        ],
      ),
    );
  }
}
