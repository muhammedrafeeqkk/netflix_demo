import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../main_widgets/appbar_widgets.dart';

class Screen_New_hot extends StatelessWidget {
  const Screen_New_hot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidgets(title: 'New&Hot'),
        ),
        body: Text('New&Hot'),
      ),
    );
  }
}
