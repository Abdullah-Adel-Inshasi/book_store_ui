import 'package:book_store/screens/explore_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int selectedBNBIndex = 0;

  List<Widget> bnbScreens = [
ExploreScreen(),
    Center(
      child: Text('Reading'),
    ),
    Center(
      child: Text('Bookmarks'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF9FE),
      body: bnbScreens[selectedBNBIndex],
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),blurRadius: 20,offset: Offset(0,-3))]
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('pressed explore');
                  setState(() {
                    selectedBNBIndex = 0;
                  });
                  print(selectedBNBIndex);
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.explore,
                        size: 30,
                        color: selectedBNBIndex == 0
                            ? Color(0xFF305F72)
                            : Colors.grey),
                    SizedBox(height: 8),
                    Text('Explore',
                        style: TextStyle(
                            color: selectedBNBIndex == 0
                                ? Color(0xFF305F72)
                                : Colors.grey)),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('pressed reading');
                  setState(() {
                    selectedBNBIndex = 1;
                  });
                  print(selectedBNBIndex);
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.library_books,
                        size: 30,
                        color: selectedBNBIndex == 1
                            ? Color(0xFF305F72)
                            : Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text('Reading',
                          style: TextStyle(
                              color: selectedBNBIndex == 1
                                  ? Color(0xFF305F72)
                                  : Colors.grey)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('pressed bookmark');
                  setState(() {
                    selectedBNBIndex = 2;
                  });
                  print(selectedBNBIndex);
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.bookmark,
                        size: 30,
                        color: selectedBNBIndex == 2
                            ? Color(0xFF305F72)
                            : Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Bookmarks',
                      style: TextStyle(
                          color: selectedBNBIndex == 2
                              ? Color(0xFF305F72)
                              : Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
