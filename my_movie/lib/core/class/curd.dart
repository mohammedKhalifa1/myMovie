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
}
