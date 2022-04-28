part of 'search_username_cubit.dart';

@immutable
abstract class SearchUsernameState {}

class SearchUsernameInitial extends SearchUsernameState {
  List<UsernameModel> usernameData = [];
  String statusResponse;
  SearchUsernameInitial(
      {required this.usernameData, required this.statusResponse});
}

//STATE FOR USERNAME

class SearchUsernameLoaded extends SearchUsernameState {
  List<UsernameModel> usernameData = [];
  String statusResponse;
  SearchUsernameLoaded(
      {required this.usernameData, required this.statusResponse});
}

class SearchUsernameError extends SearchUsernameState {
  List<UsernameModel> usernameData = [];
  String statusResponse;
  SearchUsernameError(
      {required this.usernameData, required this.statusResponse});
}

//STATE FOR ISSUES
class SearchIssuesLoaded extends SearchUsernameState {
  List<IssuesModel> issuesData = [];
  String statusResponse;
  SearchIssuesLoaded({required this.issuesData, required this.statusResponse});
}

class SearchIssuesnameError extends SearchUsernameState {
  List<IssuesModel> issuesData = [];
  String statusResponse;
  SearchIssuesnameError(
      {required this.issuesData, required this.statusResponse});
}

//STATE FOR REPOSITORIES
class SearchRepositoriesLoaded extends SearchUsernameState {
  List<RepositoryModel> repositoriesData = [];
  String statusResponse;
  SearchRepositoriesLoaded(
      {required this.repositoriesData, required this.statusResponse});
}

class SearchRepositoriesError extends SearchUsernameState {
  List<RepositoryModel> repositoriesData = [];
  String statusResponse;
  SearchRepositoriesError(
      {required this.repositoriesData, required this.statusResponse});
}
