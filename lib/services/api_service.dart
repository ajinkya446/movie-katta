import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../config/constants.dart';

class APIService {
  final headers = {
    "accept": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjcyN2RhOWFjZjYxNTczYjVhOThkOTgyODMxNDNkYyIsIm5iZiI6MTczMzIxMDMxNy4yOTUsInN1YiI6IjY3NGViMGNkMTIyMmFkYmI2M2RmMGVkZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bluJ9N9fgZngI-sQ2Li86DM9SDWEinPUmCmLzGK3hJM"
  };

  /// HTTP API Get Method
  Future<dynamic> getMethod(String endURL) async {
    final result = await http.get(Uri.parse(Constants.baseURL + endURL), headers: headers);
    if (result.statusCode == 200) {
      print(jsonDecode(result.body));
      return jsonDecode(result.body);
    }
    return null;
  }
}
