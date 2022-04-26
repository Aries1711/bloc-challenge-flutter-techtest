// ignore_for_file: prefer_collection_literals

class UsernameModel {
  late int id;
  late String name, imageUrl, urlGithub;

  UsernameModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.urlGithub,
  });

  UsernameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['login'];
    imageUrl = json['avatar_url'];
    urlGithub = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['login'] = name;
    data['avatar_url'] = imageUrl;
    data['html_url'] = urlGithub;
    return data;
  }
}
