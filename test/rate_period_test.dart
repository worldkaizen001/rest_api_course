
import 'package:flutter_test/flutter_test.dart';
import 'package:lokota/api_services.dart';
import 'package:lokota/models/rate_period.dart';
import 'package:lokota/pages/exchange_rate.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'countries_test.mocks.dart';


@GenerateMocks([http.Client])
void main (){

  group('Rate Period Mock', () {

    ApiServices apiServices = ApiServices();
    var client = MockClient();
    test('successful call', () async {
      String endpoint = 'https://rest.coinapi.io/v1/exchangerate/history/periods';

      var uri = Uri.parse(endpoint);

      when(client.get(uri,headers: {
        'X-CoinAPI-Key': '2B8796CE-74ED-4550-A853-170D0B343899',

      })).thenAnswer((_) async {
        return http.Response('{"period_id": "1SEC","length_seconds": 1,"length_months": 0,"unit_count": 1,"unit_name": "second","display_name": "1 Second"}', 200);
      });

      expect(await apiServices.getPeriod(client) , isA<RatePeriod>());

    });
  });

}