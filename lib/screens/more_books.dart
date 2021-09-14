import 'package:book_store/models/book_model.dart';
import 'package:book_store/screens/book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'explore_screen.dart';

class MoreBooksScreen extends StatelessWidget {
  final Book book;

  const MoreBooksScreen({Key? key, required this.book}) : super(key: key);

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
                    SizedBox(height: 30),
                    SimpleBookDetails(book: book),
                    SizedBox(height: 50),
                    MoreRecommendedCarousel(),
                    SizedBox(height: 30),
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

class MoreRecommendedCarousel extends StatelessWidget {
  const MoreRecommendedCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //more recommended
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'More Recommended',
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF305F72),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_horiz_sharp),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 220,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Book book = books[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: BookDetails(book: book),
                        type: PageTransitionType.fade),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(5, 5),
                              color: Color(0xFF0074A3).withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            book.imageUrl,
                            width: 120,
                            height: 170,
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'by ${book.auhton_name}',
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF4F9DBC)),
                      ),
                      Text(
                        book.book_name,
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          color: Color(0xFF305F72),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class SimpleBookDetails extends StatelessWidget {
  const SimpleBookDetails({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //title
          Text(
            'Top E-Book Trending',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF305F72)),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Book Image
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF305F72),
                        offset: Offset(0, 5),
                        blurRadius: 20)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    book.imageUrl,
                    width: 160,
                    height: 240,
                  ),
                ),
              ),
              //book Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.auhton_name,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF305F72),
                    ),
                  ),
                  Text(
                    'by ${book.auhton_name}',
                    style: TextStyle(
                        color: Color(0xFF4F9DBC),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text('${book.rating}/5'),
                  SizedBox(height: 10),
                  Text(
                    '\$${book.price}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: BookDetails(
                              book: book,
                            ),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFE35959),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
