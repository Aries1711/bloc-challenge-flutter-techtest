// ignore_for_file: prefer_collection_literals

class RepositoryModel {
  late int id, totalForks, totalWatcher, totalStars;
  late String title, createdDate, urlRepository;

  RepositoryModel({
    required this.id,
    required this.totalForks,
    required this.totalWatcher,
    required this.totalStars,
    required this.title,
    required this.createdDate,
    required this.urlRepository,
  });

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalForks = json['forks'];
    totalWatcher = json['watchers'];
    totalStars = json['score'];
    title = json['name'];
    createdDate = json['created_at'];
    urlRepository = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['forks'] = totalForks;
    data['watchers'] = totalWatcher;
    data['score'] = totalStars;
    data['name'] = title;
    data['created_at'] = createdDate;
    data['html_url'] = urlRepository;
    return data;
  }
}
