// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_reppo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchReppo _$SearchReppoFromJson(Map<String, dynamic> json) => SearchReppo(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => SearchResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchReppoToJson(SearchReppo instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SearchResultData _$SearchResultDataFromJson(Map<String, dynamic> json) =>
    SearchResultData(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      backGroundPath: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$SearchResultDataToJson(SearchResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backGroundPath,
    };
