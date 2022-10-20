import 'package:flutter/material.dart';
// import 'package:flutter_learn/src/modules/googlemap/current_location.dart';
import 'package:flutter_learn/src/modules/googlemap/simple_google_map.dart';

class HomeScreenMap extends StatefulWidget {
  const HomeScreenMap({Key? key}) : super(key: key);

  @override
  State<HomeScreenMap> createState() => _HomeScreenMapState();
}

class _HomeScreenMapState extends State<HomeScreenMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Google Maps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const SimpleGoogleMapScreen();
                  }));
                },
                child: const Text("Simple Map")),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (BuildContext context) {
            //         return const CurrentLocationScreen();
            //       }));
            //     },
            //     child: const Text("User current location")),
          ],
        ),
      ),
    );
  }
}
