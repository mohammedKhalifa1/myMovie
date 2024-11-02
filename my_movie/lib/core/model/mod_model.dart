class OmdModel {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  OmdModel({this.title, this.year, this.imdbID, this.type, this.poster});

  OmdModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }
}
