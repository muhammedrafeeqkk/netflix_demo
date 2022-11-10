import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/Search/widget/Search_Title.dart';

const imageUrl2 =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/rSq6cq0LCcbro10jbEaPTEb3WmW.jpg";

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Searchtitle(title: 'Movies & TV'),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.2 / 1.9,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:const DecorationImage(
              image: NetworkImage(imageUrl2), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
