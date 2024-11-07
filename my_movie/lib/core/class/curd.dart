import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:my_movie/core/class/status_request.dart';

class Curd {
  Future<Either<StatusRequest, Map>> getData(String url) async {
    try {
      var request = await http.get(Uri.parse(url));
      if (request.statusCode == 200) {
        return right(jsonDecode(request.body));
      } else {
        return left(StatusRequest.error);
      }
    } catch (e) {
      return left(StatusRequest.serverFailure);
    }
  }

  // String url = "https://myanimelist.p.rapidapi.com/anime/52991";
  // Map<String, String> headers = {
  //   'x-rapidapi-key': 'd46b2f9769mshc972327ac1bd94ap1fd5aajsn0d3e81817890',
  //   'x-rapidapi-host': 'myanimelist.p.rapidapi.com'
  // };

  // test() async {
  //   final response = await http.get(Uri.parse(url), headers: headers);

  //   if (response.statusCode == 200) {
  //     // طباعة الاستجابة بتنسيق JSON
  //     print(jsonDecode(response.body));
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }
}
