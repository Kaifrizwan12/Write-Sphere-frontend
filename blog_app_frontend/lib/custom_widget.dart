import 'dart:ui';
import 'package:blog_app_frontend/detailsPage.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogPreview extends StatelessWidget {
  final String BlogName;
  final String BlogContentPreview;
  final String BlogAuthor;
  final String BlogDate;
  final String blogContent;
  final List<String> blogGenre;
  final String likes;
  final String comments;
  final String blogId;

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  const BlogPreview({
    super.key,
    required this.blogId,
    required this.BlogName,
    required this.BlogContentPreview,
    required this.blogContent,
    required this.BlogAuthor,
    required this.BlogDate,
    required this.blogGenre,
    required this.likes,
    required this.comments,
  });

  int ReadTimeCalc(String content) {
    List<String> SplContent = content.split(' ');
    debugPrint(SplContent.length.toString());
    return (SplContent.length / 200).ceil();
  }

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
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ProfilePicture(
                                    name: BlogAuthor,
                                    radius: MediaQuery.of(context).size.width *
                                        0.065,
                                    fontsize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    random: false,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        BlogAuthor,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.045,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        BlogDate,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.article,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    BlogName,
                                    maxLines: null,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.07,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.book,
                                        color: Color(0xFFE2D3F5),
                                        size: 18,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        '${ReadTimeCalc(blogContent)} min read',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    BlogContentPreview,
                                    maxLines: null,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                          Text(
                                            likes,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Montserrat',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.chat_bubble_outline,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                          Text(
                                            comments,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Montserrat',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.bookmark_border_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Wrap(
                                    children: blogGenre
                                        .map((e) => GenreBox(context, e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )));
      },
      openBuilder: (BuildContext context, VoidCallback _) {
        return DetailsPage(
            BlogName: BlogName,
            BlogContentPreview: BlogContentPreview,
            BlogAuthor: BlogAuthor,
            BlogDate: BlogDate,
            blogContent: blogContent,
            blogGenre: blogGenre,
            blogId: blogId,
            comments: comments,
            likes: likes);
      },
    );
  }
}

Widget GenreBox(BuildContext context, String genre) {
  return Container(
    margin: const EdgeInsets.only(right: 5),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: const Color(0xFFE2D3F5).withOpacity(0.2),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFE2D3F5).withOpacity(0.05),
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
        fontSize: MediaQuery.of(context).size.width * 0.03,
      ),
    ),
  );
}
