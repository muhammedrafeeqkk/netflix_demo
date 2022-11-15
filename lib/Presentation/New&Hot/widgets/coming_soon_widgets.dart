import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/New&Hot/widgets/image_with_muteicon.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {Key? key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Grey),
              ),
              Text(
                day,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )
            ],
          ),
          width: 50,
        ),
        SizedBox(
          height: 500,
          width: ScreenWidth - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWithMuteIcon(url: posterPath),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  icontext(icon: Icons.add_alert_sharp, title: 'Remind me'),
                  SizedBox(
                    width: 40,
                  ),
                  icontext(
                    icon: Icons.info_outline,
                    title: 'info',
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('Coming on $day $month'),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/netflixlogo.png',
                    ),
                    height: 15,
                  ),
                  Text(
                    'FILM',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Grey),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column icontext({required IconData icon, required String title}) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: White,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Grey),
        )
      ],
    );
  }
}
