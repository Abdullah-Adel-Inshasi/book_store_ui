import 'package:book_store/screens/book_screen.dart';
import 'package:flutter/material.dart';

import 'explore_screen.dart';

class MoreBooksScreen extends StatelessWidget {
  const MoreBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF9FE),
      body: Stack(
        children: [
          Blobs(),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    HeaderWithTitle(title: 'More Books'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
