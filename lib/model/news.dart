class NewsModel {
  bool? error;
  List<Results>? results;
  String? message;
  String? contentUrl;

  NewsModel({this.error, this.results, this.message, this.contentUrl});

  NewsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    message = json['message'];
    contentUrl = json['content_url'];
  }
}

class Results {
  String? latestNewsTitle;
  String? latestNewsDescription;
  String? latestNewsLink;
  String? latestNewsImg;
  String? latestNewsSchoolId;
  int? created_At;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Results(
      {this.latestNewsTitle,
      this.latestNewsDescription,
      this.latestNewsLink,
      this.latestNewsImg,
      this.latestNewsSchoolId,
      this.created_At,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Results.fromJson(Map<String, dynamic> json) {
    latestNewsTitle = json['latest_news_title'];
    latestNewsDescription = json['latest_news_description'];
    latestNewsLink = json['latest_news_link'];
    latestNewsImg = json['latest_news_img'];
    latestNewsSchoolId = json['latest_news_school_id'];
    created_At = json['created_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
