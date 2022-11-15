import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';


class homeMainCard extends StatelessWidget {
  final String description;
  final List<String> posterList;

  const homeMainCard(
      {Key? key,
      required this.description,
      required this.posterList,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hometitle(title: description),
        LimitedBox(
            maxHeight: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  posterList.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: MainCard1(
                            movieimageurl: posterList[index ]),
                      )),
            )),
      ],
    );
  }
}

class MainCard1 extends StatelessWidget {
  final String movieimageurl;
  const MainCard1({Key? key, required this.movieimageurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 110,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(movieimageurl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}

class Number_card extends StatelessWidget {
  final int index;
  final String tvimageurl;
  const Number_card({Key? key, required this.index, required this.tvimageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Container(
              height: 170,
              width: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(tvimageurl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ],
        ),
        Positioned(
            left: 3,
            bottom: -10,
            child: BorderedText(
                strokeWidth: 3,
                strokeColor: White,
                child: Text(
                  '$index',
                  style: TextStyle(fontSize: 80, color: Black),
                )))
      ],
    );
  }
}

class NmberHomecard extends StatelessWidget {
  final List<String> posterpathlist;
   NmberHomecard({
    Key? key, required this.posterpathlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hometitle(title: 'Top 10 TV Shows in India Today'),
        LimitedBox(
            maxHeight: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                posterpathlist.length,
                  (index) => Padding(
                      padding: const EdgeInsets.all(5.0), child: 

                       Number_card(index: index + 1,tvimageurl:posterpathlist[index] ),
                      )),
            )),
      ],
    );
  }
}

class hometitle extends StatelessWidget {
  final String title;
  const hometitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
