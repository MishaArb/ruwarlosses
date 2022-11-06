class LossesModel{
  final String title;
  final String longTitle;
  final String url;
  final String refUrl;
  final List dataLosses;


  LossesModel(
      {required this.title,
        required this.longTitle,
        required this.url,
        required this.refUrl,
        required this.dataLosses,
      });

  factory LossesModel.fromJson(Map<String, dynamic> json) {
    return LossesModel(
      title: json['title'],
      longTitle: json['long_title'],
      url: json['url'],
      refUrl: json['ref_url'],
      dataLosses: json['data'],
    );
  }
}


class DataLosses{
  final String date;
  final int total;
  DataLosses({required this.date, required this.total});
  factory DataLosses.fromJson(Map<String, dynamic> json){
    return DataLosses(date: json['at'], total: json['val']);
  }
}
