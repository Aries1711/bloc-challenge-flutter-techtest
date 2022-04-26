// ignore_for_file: prefer_collection_literals

class IssuesModel {
  late int id;
  late String title, updateDates, issuesStates, urlIssues;

  IssuesModel({
    required this.id,
    required this.title,
    required this.updateDates,
    required this.issuesStates,
    required this.urlIssues,
  });

  IssuesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    updateDates = json['updated_at'];
    issuesStates = json['state'];
    urlIssues = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['updated_at'] = updateDates;
    data['state'] = issuesStates;
    data['html_url'] = urlIssues;
    return data;
  }
}
