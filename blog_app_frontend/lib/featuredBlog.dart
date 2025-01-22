import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:blog_app_frontend/featuredDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FeaturedBlog extends StatelessWidget {
  final String BlogName;
  final String BlogContentPreview;
  final String BlogAuthor;
  final String BlogDate;
  final String blogContent;
  final List<String> blogGenre;
  final String likes;
  final String comments;
  final String blogId;

  final List<String> bgs = [
    'assets/images/bg1.jpg',
    'assets/images/bg2.jpg',
    'assets/images/bg3.jpg',
    'assets/images/bg4.jpg',
    'assets/images/bg5.jpg',
    'assets/images/bg7.jpg',
    'assets/images/bg8.jpg',
    'assets/images/bg9.jpg',
    'assets/images/bg10.jpg',
    'assets/images/bg11.jpg',
    'assets/images/bg12.jpg',
    'assets/images/bg13.jpg',
    'assets/images/bg14.jpg',
  ];

  FeaturedBlog({
    super.key,
    required this.BlogName,
    required this.BlogContentPreview,
    required this.BlogAuthor,
    required this.BlogDate,
    required this.blogContent,
    required this.blogGenre,
    required this.likes,
    required this.comments,
    required this.blogId,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionType: ContainerTransitionType.fade,
        middleColor: Colors.transparent,
        transitionDuration: const Duration(milliseconds: 600),
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: GestureDetector(
                onTap: openContainer,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.4,
                            image: AssetImage(
                                bgs[DateTime.now().second % bgs.length]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Featured Blog',
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ComicaBoom',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.065,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        speed:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      ),
                                    ],
                                    stopPauseOnTap: true,
                                    repeatForever: true,
                                    displayFullTextOnTap: true,
                                    pause: const Duration(milliseconds: 3000),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  for (var genre in blogGenre)
                                    Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFFE2D3F5)
                                            .withOpacity(0.2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFE2D3F5)
                                                .withOpacity(0.05),
                                            blurRadius: 2,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        genre,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              const SizedBox(height: 60),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Text(
                                  maxLines: null,
                                  BlogContentPreview,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.046,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.download,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            print('Download Clicked');
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.share,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            print('Share Clicked');
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.bookmark_border,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            print('Saved Clicked');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      BlogDate,
                                      style: TextStyle(
                                        color: Colors.grey[200],
                                        fontFamily: 'Montserrat',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        openBuilder: (BuildContext context, VoidCallback closeContainer) {
          return FeaturedDetailsPage(
              BlogName: BlogName,
              BlogContentPreview: BlogContentPreview,
              BlogAuthor: BlogAuthor,
              BlogDate: BlogDate,
              blogContent: blogContent,
              blogGenre: blogGenre,
              blogId: blogId,
              comments: comments,
              likes: likes);
        });
  }
}
