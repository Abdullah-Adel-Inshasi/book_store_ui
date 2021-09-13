import 'package:book_store/models/book_model.dart';
import 'package:book_store/screens/book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Blobs(),
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  CustomHeader(),
                  SizedBox(height: 30),
                  CustomTextField(),
                  SizedBox(height: 18),
                  CategorySelector(),
                  SizedBox(height: 20),
                  TrendingBooksCarousel(),
                  SizedBox(height: 16),
                  ContinueReadingCard()
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ContinueReadingCard extends StatelessWidget {
  const ContinueReadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 14),
          decoration: BoxDecoration(
            color: Color(0xFF4F9DBC),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 200,
                right: -350,
                child: Transform(
                    transform: Matrix4.rotationZ(2.4),
                    child: Image.asset('assets/images/blobs/Blob2.png')),
              ),
              Positioned(
                left: 250,
                child: Image.asset('assets/images/blobs/Blob2.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 32, 30, 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'More Recommended',
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.more_horiz_sharp,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3),
                              blurRadius: 6)
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                books[4].imageUrl,
                                height: 75,
                                width: 50,
                              ),
                            ),
                          ),
                          SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                books[4].book_name,
                                style: GoogleFonts.raleway(
                                    color: Color(0xFF305F72),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'by ${books[4].auhton_name}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4F9DBC)),
                              ),
                              Text('${books[4].rating}/5')
                            ],
                          ),
                          Spacer(),
                          Text('')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: GestureDetector(
            onTap: () {
              print('open more recommended page');
            },
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF305F72),
              ),
              child: Icon(
                Icons.keyboard_arrow_up_sharp,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TrendingBooksCarousel extends StatelessWidget {
  const TrendingBooksCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            'Trending Books',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF305F72)),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Book book = books[index];
              return ImageCarouselItem(
                book: book,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ImageCarouselItem extends StatelessWidget {
  final Book book;

  const ImageCarouselItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        goToBookDetails(book,context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: book.imageUrl,
                      child: Image.asset(
                        book.imageUrl,
                        height: 180,
                        width: 120,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 120,
                  child: Text(
                    "by ${book.auhton_name}",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4F9DBC),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 120,
              child: Text(
                book.book_name,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  color: Color(0xFF305F72),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 goToBookDetails(Book book,BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> BookDetails(book: book)));
}

class Blobs extends StatelessWidget {
  const Blobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -200,
          top: -50,
          child: Image.asset(
            'assets/images/blobs/Blob 1.png',
            color: Color(0xFF579ACA).withOpacity(0.55),
          ),
        ),
        Positioned(
          top: -250,
          right: -200,
          child: Image.asset(
            'assets/images/blobs/Blob2.png',
            color: Color(0xFF4E92B1).withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  Categories selectedCategory = Categories.Comics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 0),
          child: Text(
            'Categories',
            style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF305F72)),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Categories category = Categories.values[index];
              bool isSelected = category == selectedCategory;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                child: Container(
                  width: 100,
                  height: 35,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFF305F72)
                        : Color(0xFFCBE5F3).withOpacity(0.46),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    describeEnum(category),
                    style: GoogleFonts.raleway(
                      color: isSelected ? Colors.white : Color(0xFF305F72),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.bold,
                    ),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: GoogleFonts.raleway(
            color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 20),
          alignLabelWithHint: true,
          hintText: 'Search books here..',
          hintStyle: GoogleFonts.raleway(
              color: Color(0xFF212121).withOpacity(0.5),
              fontWeight: FontWeight.w500),
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFF305F72),
          ),
        ),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () => print('open drawer'),
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/others/profile_picture.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
