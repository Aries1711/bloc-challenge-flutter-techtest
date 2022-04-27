import 'dart:io';

import 'package:dev_test_github_search/constants/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as connection;

String? token = '';

Future getSharedprefences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  if (token != '' && token != null) {
    headers[HttpHeaders.authorizationHeader] = "Bearer " + token!;
  }
  return headers;
}

Future<connection.Response> POST(String url, String body) async {
  return await connection.post(
    Uri.https(API_URL, url),
    body: body,
    headers: await getSharedprefences(),
  );
}

Future<connection.Response> POSTPARSE(String url, String body) async {
  return await connection.post(
    Uri.parse(url),
    body: body,
    headers: await getSharedprefences(),
  );
}

Future<connection.Response> GET(String url) async {
  var uri = Uri.https(API_URL, url);
  final response = await connection.get(
    uri,
    headers: await getSharedprefences(),
  );
  return response;
}

Future<connection.Response> GETPARSE(String url) async {
  var uri = Uri.parse(url);
  final response = await connection.get(
    uri,
    headers: await getSharedprefences(),
  );
  return response;
}
