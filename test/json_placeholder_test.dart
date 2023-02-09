import 'package:flutter_test/flutter_test.dart';
import 'package:lokota/models/countries_model.dart';
import 'album_test.mocks.dart';
import 'package:http/http.dart' as http;
import 'package:lokota/api_services.dart';
import 'package:lokota/models/coin_model.dart';
import 'package:lokota/models/placeholder.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';



@GenerateMocks([http.Client])
void main(){
  ApiServices apiServices = ApiServices();

  group('fetch Post', () {
    test('returns a post if the http call completes successfully', () async{
      var client = MockClient();

      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))).thenAnswer((_) async {
        return http.Response('{ "userId": 1, "id": 2, "title": "Wellboy", "body": "man" }', 200);
      });

      expect(await apiServices.getJson(client), isA<JsonData>());
    });

    test('throws exception on bad request', () async {
      var client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))).thenAnswer((_) async{
        return http.Response('bad request', 404);
      });
      expect( apiServices.getJson(client), throwsException);
    });


    test('test JsonData model', (){
      JsonData jsonData = JsonData(userId: 1, id: 22, title: 'playing', body: 'trying');

      expect(jsonData, isA<JsonData>());

    });

    test('coin data', () {
      CoinData coinData = CoinData(time: DateTime.now(), assetIdBase: 'USDT', assetIdQuote: '24', rate: 22.2);

      expect(coinData, isA<CoinData>());
    });

    test('sumAll ', (){
      ApiServices apiServices = ApiServices();

      var check = apiServices.sumAll(2, 2);

      expect(check, 4);
    });
  });
}