import 'package:flutter/material.dart';
import 'package:flutter_learn/src/bloc/bloc_builder.dart';
import 'package:flutter_learn/src/modules/http/controller/api_bloc.dart';
import 'package:flutter_learn/src/modules/signin/view_model/signin_model.dart';
// import 'package:flutter_learn/src/modules/http/mapdata.dart';
// import 'package:http/http.dart' as http;

class HomeScreenHttp extends StatefulWidget {
  const HomeScreenHttp({super.key});

  @override
  State<HomeScreenHttp> createState() => _HomeScreenHttpState();
}

class _HomeScreenHttpState extends State<HomeScreenHttp> {
  final ApiBlocController _apiBlocController = ApiBlocController();
  // final Map _names = {};

  @override
  void initState() {
    super.initState();
    _apiBlocController.updateState();
  }

  //late Future<MapData> map;

  // @override
  // void initState() {
  //   super.initState();
  //   map = _mapdata();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _apiBlocController,
        builder: () {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FutureBuilder<MapData>(
                  //     future: map,
                  //     builder: (context, value) {
                  //       return Text(value.data?.name ?? '');
                  //     }),
                  Image.network(_apiBlocController
                          .state.responseModel?.data['metadata']["images"][0] ??
                      ''),
                  Text(_apiBlocController.state.responseModel?.data['metadata']
                          ['name'] ??
                      ''),
                  Text(_apiBlocController.state.responseModel?.data['metadata']
                          ['description'] ??
                      ''),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //_mapdata();
                      _apiCall();
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 2,
                        color: Color.fromARGB(255, 11, 11, 11),
                      ),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color.fromARGB(255, 39, 228, 22),
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                    ),
                    child: const Text('Http Button',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Future<MapData> _mapdata() async {
  //   var data = await http
  //       .get(Uri.parse('https://list.ly/api/v4/meta?url=http://google.com'));
  //   print(data);

  //   return MapData.fromJson(jsonDecode(data.body));
  // }

  _apiCall() {
    if (_apiBlocController.state.appState == AppState.success) {
      Navigator.pushNamed(context, 'HttpScreen');
    }
  }
}

// class MapData {
//   final String name;
//   final String description;

//   const MapData({
//     required this.name,
//     required this.description,
//   });

//   factory MapData.fromJson(Map<String, dynamic> json) {
//     return MapData(
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//     );
//   }
// }



// https://date.nager.at/api/v2/publicholidays/2020/US
// https://list.ly/api/v4/meta?url=http://google.com
// https://api.imgflip.com/get_memes
// https://dog.ceo/api/breeds/image/random

