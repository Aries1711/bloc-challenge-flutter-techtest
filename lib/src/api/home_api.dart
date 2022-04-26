import 'package:dev_test_github_search/src/api/base_api.dart';
import 'package:http/http.dart' as connection;

class HomeApi {
  Future<connection.Response> apiGetSearchRepositories(
      String nameRepositories) async {
    return await GETPARSE(
        'https://api.github.com/search/repositories?q=$nameRepositories');
  }

  Future<connection.Response> apiGetSearchUsername(String nameUsername) async {
    return await GETPARSE(
        'https://api.github.com/search/repositories?q=$nameUsername');
  }

  Future<connection.Response> apiGetSearchIssues(String nameIssues) async {
    return await GETPARSE(
        'https://api.github.com/search/repositories?q=$nameIssues');
  }
}
