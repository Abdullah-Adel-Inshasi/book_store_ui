import 'package:book_store/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetails extends StatelessWidget {
  final Book book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF9FE),
      body: Stack(
        children: [
          Blob(),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    BookDetailsHeader(),
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

class BookDetailsHeader extends StatelessWidget {
  const BookDetailsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RoundedCornersIconButton(
            icon: Icons.arrow_back,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Text(
            'Book Details',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF305F72),
            ),
          ),
          RoundedCornersIconButton(
            icon: Icons.send,
            onTap: () {
              print('share with');
            },
          ),
        ],
      ),
    );
  }
}

class RoundedCornersIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RoundedCornersIconButton(
      {Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: Color(0xFF305F72),
        ),
      ),
    );
  }
}

class Blob extends StatelessWidget {
  const Blob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -140,
      top: -200,
      child: Transform.rotate(
        angle: 0,
        child: Image.asset(
          'assets/images/blobs/Blob2.png',
          color: Color(0xFF4E92B1),
        ),
      ),
    );
  }
}
