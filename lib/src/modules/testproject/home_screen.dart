// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  List show_list = [
    'Prime Movies',
    'Netflix',
    'Pegga Pig live',
    'Prateek kahud',
    'Sun',
    'Raj Movie'
  ];
  final List<String> list = [
    "Trending",
    'Movies',
    'Events',
    'Sports',
    'Streaming',
    'Video',
  ];

  List images = [
    'assets/images/Ellipse1.png',
    'assets/images/Ellipse1.png',
    'assets/images/Ellipse1.png',
    'assets/images/Ellipse1.png',
    'assets/images/Ellipse1.png',
    'assets/images/Ellipse1.png',
  ];

  List text = [
    'Should You Watch Rishab Sheety Movie',
    'Should You Watch Rishab Sheety Movie',
    'Should You Watch Rishab Sheety Movie',
    'Should You Watch Rishab Sheety Movie',
    'Should You Watch Rishab Sheety Movie',
    'Should You Watch Rishab Sheety Movie',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buzz'),
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: show_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _circleTopList(context, index);
                  },
                ),
              ),
              const Divider(),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  for (var item in list)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor:
                            const Color.fromARGB(255, 229, 17, 144),
                        label: Text(item),
                      ),
                    )
                ],
              ),
              const Divider(),
              Container(
                height: 800,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return _verticalList(context, index);
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget _circleTopList(context, index) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: 70.0,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/Ellipse1.png',
            ),
          ),
          Text(
            show_list[index],
          ),
        ],
      ),
    );
  }

  Widget _verticalList(context, index) {
    return Row(
      children: [
        Image.asset(
          images[index],
          width: 140,
          height: 180,
        ),
        Text(text[index]),
        const Divider(
          thickness: 2.0,
          height: 2.0,
        ),
      ],
    );
  }
}
