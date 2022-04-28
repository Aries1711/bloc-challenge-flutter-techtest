import 'package:dev_test_github_search/data/api/home_api.dart';
import 'package:http/http.dart' as connection;

class SearchRepository {
  final HomeApi _apiService = HomeApi();

  Future<connection.Response> getSearchDataUsername(String keywords) async {
    final connection.Response response =
        await _apiService.apiGetSearchUsername(keywords);
    return response;
  }

  Future<connection.Response> getSearchDataIssues(String keywords) async {
    final connection.Response response =
        await _apiService.apiGetSearchIssues(keywords);
    return response;
  }

  Future<connection.Response> getSearchDataRepositories(String keywords) async {
    final connection.Response response =
        await _apiService.apiGetSearchRepositories(keywords);
    return response;
  }
}
