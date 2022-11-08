import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/Search/widget/SearchIdleWideget.dart';
import 'package:netflix_demo/Presentation/Search/widget/Search_result.dart';

class Screen_Search extends StatelessWidget {
  const Screen_Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              backgroundColor: Grey.withOpacity(0.4),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Grey,
              ),
              style: TextStyle(color: White),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Expanded(child: SearchResult())
          Expanded(child: SearchIdleWidget())
        ],
      )),
    );
  }
}
