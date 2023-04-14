import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:tutorialapi/models/giphy_model.dart';


List<Gifs> listGifs=[];
 const String _base='api.giphy.com';
 const String _apikey='cI8P1HOBQtP52N271yU4Oe339alFwQNQ';
 const String _limit='25';
 const String _rating='g';


final giPhyProvider = FutureProvider<List<Gifs>>((ref) async {
final url =Uri.https(_base,'v1/gifs/trending',{
'apikey':_apikey,'limit':_limit,'rating':_rating
});
final response= await http.get(url);
final giphylist= giphyFromJson(response.body);
listGifs=giphylist.data;
  return listGifs;
});