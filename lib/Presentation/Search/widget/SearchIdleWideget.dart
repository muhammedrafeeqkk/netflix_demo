import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/Search/widget/Search_Title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Searchtitle(title: 'Top Searches'),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => TopSearchesTile(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchesTile extends StatelessWidget {
  const TopSearchesTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 70,
          width: ScreenWidth * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        Expanded(
            child: Text('   After',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        Icon(
          Icons.play_circle_outline,
          color: White,
          size: 40,
        )
      ],
    );
  }
}
