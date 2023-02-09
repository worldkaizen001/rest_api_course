import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:lokota/models/album_model.dart';
import 'package:lokota/main.dart';
import 'package:lokota/pages/album_widget.dart';
// import 'package:mocking/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'album_test.mocks.dart';

@GenerateMocks([http.Client])
void main (){


  group('fetch album Test', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_)  async => http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(client), isA<Album>());
  });

    test('returns an expection if album no found', ()async{
      var client = MockClient();

      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))).thenAnswer((_) async{
        return
        http.Response('Not found', 404);
      });
      expect(fetchAlbum(client), throwsException);
    });
});}