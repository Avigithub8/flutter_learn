import 'package:flutter/material.dart';
// import 'package:flutter_learn/module/authentication/login.dart';
// import './module/authentication/signup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  void opendrawer() {
    if (_scaffoldkey.currentState != null) {
      _scaffoldkey.currentState!.closeDrawer();
    }
    _scaffoldkey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldkey,
      // drawer: Drawer(
      //   child: Center(
      //     child: Text('Drawer is On Now!'),
      //   ),
      // ),
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button  this many times in home:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),

      // body: Container(
      //   width: 200.0,
      //   height: 100.0,
      //   alignment: Alignment.center,
      //   padding: EdgeInsets.all(20),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.horizontal(
      //         left: Radius.circular(40), right: Radius.circular(40)),
      //     color: Colors.green,
      //   ),
      //   child: Text("Hello! I am in the container widget",
      //       style: TextStyle(fontSize: 25)),
      // ),

      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: _incrementCounter,
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     FloatingActionButton(
      //       onPressed: _decrementCounter,
      //       tooltip: 'Decrement',
      //       child: const Icon(Icons.remove),
      //     ),
      //     IconButton(
      //       tooltip: 'Favourite',
      //       onPressed: () {
      //         setState(() {
      //           _isFav = !_isFav;
      //         });
      //       },
      //       iconSize: 40,
      //       isSelected: false,
      //       selectedIcon: const Icon(Icons.favorite),
      //       icon: _isFav
      //           ? Icon(
      //               Icons.favorite,
      //               color: Colors.blue,
      //             )
      //           : Icon(
      //               Icons.favorite_border,
      //               color: Colors.red,
      //             ),
      //     )
      //   ],
      //), // This trailing comma makes auto-formatting nicer for build methods.

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black26,
                      offset: Offset(2, 0),
                    )
                  ]),
              child: Row(children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 24,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    // _scaffoldkey.currentState.openDrawer();
                    opendrawer();
                  },
                ),
                const Expanded(
                  // flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '',
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        isDense: false,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  // child: Image.asset('assets/images/Ellipse2.png',
                  //   height: 35, width: 35),
                  child: Container(
                    height: 35,
                    width: 35,
                    color: Colors.blueGrey,
                  ),
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Inbox',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  wordSpacing: 5,
                ),
              ),
            ),

            //       /////////////
            //       ///
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black26,
                      offset: Offset(2, 0),
                    )
                  ]),
              child: Row(children: [
                const CircleAvatar(
                  child: Text('T'),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Title',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Text(
                            '4:00 pm',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            //       ////////////////
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black26,
                      offset: Offset(2, 0),
                    )
                  ]),
              child: Row(children: [
                const CircleAvatar(
                  child: Text('A'),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Title',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Text(
                            '3:00 pm',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SignUpPage()));

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    ' New Button',
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
                offset: Offset(2, 0),
              )
            ]),
        child: Row(mainAxisSize: MainAxisSize.min, children: const [
          Icon(Icons.edit),
          Text('Compose'),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 214, 190, 181),
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}
