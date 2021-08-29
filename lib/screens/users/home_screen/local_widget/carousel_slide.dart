import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  "assets/images/banner1.png",
  "assets/images/banner2.png",
  "assets/images/banner3.png"
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Container(
                        width: 1800,
                        height: 600,
                        child: Image.asset(
                          item,
                          fit: BoxFit.fill,
                        )),
                  ],
                )),
          ),
        ))
    .toList();

void main() {
  runApp(ShipperSelectStart());
}

class ShipperSelectStart extends StatelessWidget {
  ShipperSelectStart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: AppColors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: AppColors.yellow,
            onPressed: () => Navigator.pop(context),
          ),
          title: new Text(
            "Carousel slide",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: CarouselWithIndicatorDemo(),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              aspectRatio: 3,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.8 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
