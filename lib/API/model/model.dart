class model {
  int? userid;
  int? id;
  String? title;
  model({
    this.userid,
    this.id,
    this.title,
  });
  factory model.fromJson(Map<String, dynamic> json) =>
      model(userid: json['userid'], id: json['id'], title: json['title']);
  Map<String, dynamic> toJson() => {"userid": userid, "id": id, "title": title};
}
