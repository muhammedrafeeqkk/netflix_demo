import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_demo/Application/downloads/downloads_bloc.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Core/constans.dart';
import 'package:netflix_demo/Presentation/main_widgets/appbar_widgets.dart';

class Screen_Download extends StatelessWidget {
  Screen_Download({Key? key}) : super(key: key);
  final _Widgetlist = [Section1(), Section2(), Section3(), Section4()];

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidgets(title: 'Downloads', itIsHomePage: true),
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) => _Widgetlist[index],
          separatorBuilder: (context, index) => SizedBox(
                height: 25,
              ),
          itemCount: _Widgetlist.length),
    ));
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(
          Icons.settings,
          size: 30,
          color: White,
        ),
        SizedBox(width: screenwidth * 0.04),
        Text(
          'Smart Downloads',
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for You',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenheight * 0.025),
        const Text(
          "We'll download a personalised selection of \n movies and shows for you, so there's\n always something to watch on your \ndevice.",
          style: TextStyle(color: Grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  Section3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(DownloadsEvents.getDownloadsImages());
    });
    final screenwidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenwidth,
      height: screenwidth,
      child: BlocBuilder<DownloadsBloc, DownloadState>(
        builder: (context, state) {
          return state.isloading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: screenwidth * 0.39,
                        backgroundColor: Grey.withOpacity(0.5),
                      ),
                    ),
                    DownloadImageWidget(
                      screenwidth: Size(screenwidth * 0.4, screenwidth * 0.55),
                      margin: EdgeInsets.only(left: 140, bottom: 50),
                      imageList:
                          '$ImageAppendUrl${state.downloads[0].posterPath}',
                      angle: 20,
                    ),
                    DownloadImageWidget(
                      screenwidth: Size(screenwidth * 0.4, screenwidth * 0.55),
                      imageList:
                          '$ImageAppendUrl${state.downloads[1].posterPath}',
                      margin: EdgeInsets.only(right: 140, bottom: 50),
                      angle: -20,
                    ),
                    DownloadImageWidget(
                      screenwidth: Size(screenwidth * 0.42, screenwidth * 0.62),
                      imageList:
                          '$ImageAppendUrl${state.downloads[2].posterPath}',
                      margin: EdgeInsets.only(bottom: 8),
                    )
                  ],
                );
        },
      ),
    );
  }
}

class Section4 extends StatelessWidget {
  const Section4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Deepblue,
            onPressed: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
              child: Text(
                'Set Up',
                style: TextStyle(color: White, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: White,
            onPressed: () {},
            child: Text(
              'See what you can download',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    required this.screenwidth,
    required this.imageList,
    this.angle = 0,
    required this.margin,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size screenwidth;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: screenwidth.width,
        height: screenwidth.height,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
