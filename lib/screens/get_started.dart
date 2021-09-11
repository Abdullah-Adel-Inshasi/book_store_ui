import 'dart:ui';

import 'package:book_store/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../wrapper.dart';

class GetStarted extends StatelessWidget {
  List<PageTransitionType> x = [
    PageTransitionType.fade,
    PageTransitionType.rightToLeft
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF9FE),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFF4F9DBC),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(-120, -15, 0)
                  ..rotateZ(0.28),
                child: Image.asset(
                  'assets/images/blobs/Blob 1.png',
                  width: 300,
                  height: 250,
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(170, -150, 0)
                  ..rotateZ(0.097),
                child: Image.asset('assets/images/blobs/Blob2.png'),
              ),
            ],
          ),
          Positioned(
            top: 60,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment(0, -0.1),
                  end: Alignment(0, 1),
                  colors: [Colors.white, Colors.transparent],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/images/others/get_started_girl.png',
              ),
            ),
          ),
          Positioned.fill(
            top: 460,
            left: 30,
            right: 15,
            bottom: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reading Is\nFascinating',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      color: kDarkBlueColor,
                      fontSize: 48),
                ),
                SizedBox(height: 4),
                Text(
                  'World best writers, works and write entertaining literature for you',
                  style: TextStyle(color: Color(0xFF4F9DBC), fontSize: 16),
                ),
                Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('go to Wrapper');
                      Navigator.push(
                        context,
                        PageTransition(
                          child: Wrapper(),
                          type: PageTransitionType.rightToLeftWithFade,
                          childCurrent: this,
                          curve: Curves.bounceIn,
                        ),
                      );
                    },
                    child: Container(
                      height: 75,
                      width: 75,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kDarkBlueColor,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
