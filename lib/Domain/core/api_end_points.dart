import 'package:netflix_demo/Core/strings.dart';
import 'package:netflix_demo/Infrastructure/api_key.dart';

class API_Key_Points {
  static const download = "$kbasicurl/trending/movie/week?api_key=$api_KEY";
  static const search = "$kbasicurl/search/movie?api_key=$api_KEY";

  static const NewAndHotMovie = "$kbasicurl/discover/movie?api_key=$api_KEY";
  static const NewAndHotTV = "$kbasicurl/discover/tv?api_key=$api_KEY";
}

//&query=spiderman#
