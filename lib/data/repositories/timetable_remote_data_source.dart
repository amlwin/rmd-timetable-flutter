import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rmd_timetable/data/models/state.dart';

class TimetableRemoteDataSource {

  Future<List<StateResponse>> getStateList() async {
    final baseUrl = "http://ramdan-api-mm.herokuapp.com/api";
    final stateListQuery = """{
  states(limit: 100, page: 1, countryId: "a523a4ce44f649b2a2332ff636e9242f") {
    data {
      id
      objectId
      nameMmUni
      nameMmZawgyi
      countryId
      createdDate
      updatedDate
    }
  }
}
""";
    final http.Response response =
        await http.get(baseUrl + "?query=" + stateListQuery);
    print("state list response is $response");
    if (response.statusCode == 200) {
      print("success call");
      final Map<String, dynamic> jsonDecoded = json.decode(response.body);
      final List<StateResponse> result =
          StateResponse.fromJsonToList(jsonDecoded);
      print("result lenght is ${result.length}");
      return result;
    }
    return null;
  }
}
