import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dev_test_github_search/data/models/issues.dart';
import 'package:dev_test_github_search/data/models/repository.dart';
import 'package:dev_test_github_search/data/models/username.dart';
import 'package:dev_test_github_search/data/repositories/search_repository.dart';
import 'package:http/http.dart' as connection;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'search_username_state.dart';

class SearchUsernameCubit extends Cubit<SearchUsernameState> {
  SearchUsernameCubit()
      : super(
            SearchUsernameInitial(statusResponse: "kosong", usernameData: []));

  void onTypeSearchDataUser(String keywords) async {
    if (keywords != "") {
      SearchRepository _searchRepository = SearchRepository();
      final connection.Response dataSearch =
          await _searchRepository.getSearchDataUsername(keywords);
      if (dataSearch.statusCode == 200) {
        print(dataSearch.body);
        var decode = jsonDecode(dataSearch.body);
        List<UsernameModel> usernameData = [];
        for (var item in decode['items']) {
          usernameData.add(UsernameModel.fromJson(item));
        }
        emit(SearchUsernameLoaded(
            usernameData: usernameData, statusResponse: 'sukses'));
      } else {
        emit(SearchUsernameError(
            usernameData: [], statusResponse: 'serverError'));
      }
    }
  }

  void onTypeSearchDataIssues(String keywords) async {
    if (keywords != "") {
      SearchRepository _searchRepository = SearchRepository();
      final connection.Response dataSearch =
          await _searchRepository.getSearchDataIssues(keywords);
      if (dataSearch.statusCode == 200) {
        print(dataSearch.body);
        var decode = jsonDecode(dataSearch.body);
        List<IssuesModel> issuesData = [];
        for (var item in decode['items']) {
          issuesData.add(IssuesModel.fromJson(item));
        }
        emit(SearchIssuesLoaded(
            issuesData: issuesData, statusResponse: 'sukses'));
      } else {
        emit(SearchIssuesnameError(
            issuesData: [], statusResponse: 'serverError'));
      }
    }
  }

  void onTypeSearchDataRepositories(String keywords) async {
    if (keywords != "") {
      SearchRepository _searchRepository = SearchRepository();
      final connection.Response dataSearch =
          await _searchRepository.getSearchDataRepositories(keywords);
      if (dataSearch.statusCode == 200) {
        print(dataSearch.body);
        var decode = jsonDecode(dataSearch.body);
        List<RepositoryModel> repositoriesData = [];
        for (var item in decode['items']) {
          repositoriesData.add(RepositoryModel.fromJson(item));
        }
        emit(SearchRepositoriesLoaded(
            repositoriesData: repositoriesData, statusResponse: 'sukses'));
      } else {
        emit(SearchRepositoriesError(
            repositoriesData: [], statusResponse: 'serverError'));
      }
    }
  }
}
