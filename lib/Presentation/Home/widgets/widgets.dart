import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/Search/widget/Search_Title.dart';
import 'package:netflix_demo/Presentation/Search/widget/Search_result.dart';

class homeMainCard extends StatelessWidget {
  final String description;
  const homeMainCard({Key? key, required this.description}) : super(key: key);

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
                  10,
                  (index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: MainCard1(),
                      )),
            )),
      ],
    );
  }
}

class MainCard1 extends StatelessWidget {
  const MainCard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 110,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageUrl2), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}

class Number_card extends StatelessWidget {
  final int index;
  const Number_card({Key? key, required this.index}) : super(key: key);

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
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w220_and_h330_face/7qop80YfuO0BwJa1uXk1DXUUEwv.jpg'),
                      fit: BoxFit.cover),
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
  const NmberHomecard({
    Key? key,
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
                  10,
                  (index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Number_card(index: index + 1),
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
