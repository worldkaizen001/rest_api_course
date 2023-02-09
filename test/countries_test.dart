

import 'package:flutter_test/flutter_test.dart';
import 'package:lokota/api_services.dart';
import 'package:lokota/models/countries_model.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'album_test.mocks.dart';


@GenerateMocks([http.Client])
void main(){
  group('Testing Countries endpoint', () {
    test('', () async {
      ApiServices apiServices = ApiServices();
      var client = MockClient();

      when(client.get(Uri.parse('https://restcountries.com/v3.1/name/japan'))).thenAnswer((_) async {
        return http.Response('{"name": "japan", tld: tld, cca2: cca2, ccn3: ccn3, cca3: cca3, cioc: cioc, independent: independent, status: status, unMember: unMember, currencies: currencies, idd: idd, capital: capital, altSpellings: altSpellings, region: region, subregion: subregion, languages: languages, translations: translations, latlng: latlng, landlocked: landlocked, area: area, flag: flag, demonyms: demonyms}'
            , 200);
      });

      expect(await apiServices.getCountries(client) , isA<Countries>());
    });
  });
}