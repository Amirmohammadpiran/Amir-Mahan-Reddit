import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        bottomNavigationBar: BottomAppBar(
          child: Container(
              color: Color.fromARGB(227, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home_filled),
                    color: Color.fromARGB(214, 21, 237, 230),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.list_rounded),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white60,
                    onPressed: () {},
                  ),
                ],
              )),
        ));
  }
}
