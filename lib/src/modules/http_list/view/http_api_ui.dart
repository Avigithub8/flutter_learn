import 'package:flutter/material.dart';
import 'package:flutter_learn/src/bloc/bloc_builder.dart';

import 'package:flutter_learn/src/modules/http_list/view_controller/http_block.dart';
import 'package:flutter_learn/src/modules/signin/view_model/signin_model.dart';

class HttpScreen extends StatefulWidget {
  const HttpScreen({super.key});
  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  final ApiBloc _apiBloc = ApiBloc();

  @override
  void initState() {
    super.initState();
    _apiBloc.getAPICall();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: () {
        return Scaffold(
          appBar: AppBar(),
          body: _apiBloc.state.appState == AppState.loding
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: _apiBloc.state.modelList.length,
                            itemBuilder: (context, index) {
                              return _buildListItem(index);
                            }),
                      ),
                    ],
                  ),
                ),
        );
      },
      bloc: _apiBloc,
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 26, 241, 112),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_apiBloc.state.modelList[index].date),
          Text(_apiBloc.state.modelList[index].countryCode),
          Text(_apiBloc.state.modelList[index].name),
          Text(_apiBloc.state.modelList[index].localName)
        ],
      ),
    );
  }
}











// _data[index]["date"].toString()
//_data[index]["localName"].toString()
//_data[index]["name"].toString()
//_data[index]["countryCode"].toString()

