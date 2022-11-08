import 'package:flutter/cupertino.dart';

class Searchtitle extends StatelessWidget {
  final String title;
  const Searchtitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
