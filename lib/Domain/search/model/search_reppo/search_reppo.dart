import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_demo/Core/constans.dart';

part 'search_reppo.g.dart';

@JsonSerializable()
class SearchReppo {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchReppo({
    this.results = const [],
  });

  factory SearchReppo.fromJson(Map<String, dynamic> json) {
    return _$SearchReppoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchReppoToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'backdrop_path')
  String? backGroundPath;
  String get backgroundimageUrl => '$ImageAppendUrl$backGroundPath';
  String get posterimageUrl => '$ImageAppendUrl$posterPath';

  SearchResultData(
      {this.id, this.originalTitle, this.posterPath, this.backGroundPath});

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
