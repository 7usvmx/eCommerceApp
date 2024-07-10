import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shop/core/classes/request_status.dart';
import 'package:shop/core/functions/check_internet_connection.dart';

class Crud {
  //! Post data

  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    if (await checkInternetConnection()) {
      try {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } catch (_) {
        return left(StatusRequest.serverFailure);
      }
    } else {
      return left(StatusRequest.offlineFailure);
    }
  }
}
