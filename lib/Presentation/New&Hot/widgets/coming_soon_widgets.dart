import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/New&Hot/widgets/image_with_muteicon.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

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
                'FEB',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Grey),
              ),
              Text(
                '11',
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
              ImageWithMuteIcon(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'TALL GIRL 2',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              Text('Coming on friday'),
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
                'Tall girls 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Landing the lead in the school musical is a dream come true for jodi,until the pressure sends her confidence--and her relationship--\ninto a tailspin.',
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
