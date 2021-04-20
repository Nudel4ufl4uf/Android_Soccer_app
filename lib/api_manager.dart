import 'dart:convert';
import 'package:http/http.dart';
import 'package:soccer_app/soccermodel.dart';

class SoccerApi{
  //Url for the fixure data
  final String apiUrl = "https://v3.football.api-sports.io/fixtures?season=2020&league=39";
  //adding headers for the given data
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "b18e5c76dd39ef3d6b1c2e68b89a8b50"
  };

  Future<List<SoccerMatch>> getAllMatches() async{
    Response res = await get(apiUrl, headers: headers);
    var body;

    if(res.statusCode == 200){
      //means connecting to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body ['response'];
      print("Api service: ${body}"); //to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
  }
}