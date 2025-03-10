import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:animate_gradient/animate_gradient.dart';

class FeaturedDetailsPage extends StatefulWidget {
  final String BlogName;
  final String BlogContentPreview;
  final String BlogAuthor;
  final String BlogDate;
  final String blogContent;
  final List<String> blogGenre;
  final String likes;
  final String comments;
  final String blogId;

  int ReadTimeCalc(String content) {
    List<String> SplContent = content.split(' ');
    debugPrint(SplContent.length.toString());
    return (SplContent.length / 200).ceil();
  }

  const FeaturedDetailsPage({
    super.key,
    required this.BlogName,
    required this.BlogContentPreview,
    required this.BlogAuthor,
    required this.BlogDate,
    required this.blogContent,
    required this.blogGenre,
    required this.blogId,
    required this.comments,
    required this.likes,
  });

  @override
  State<FeaturedDetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<FeaturedDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  Color backgroundColor = getRandomColor(luminosity: 'dark');
  Color fontColor = getRandomColor(luminosity: 'light');

  void _closeMenu() {
    setState(() {
      isMenuOpen = false;
    });
  }

  bool isMenuOpen = false;
  Color starIconColor = Color(0xFFE2D3F5);
  Color saveIconColor = Color(0xFFE2D3F5);
  IconData starIcon = Icons.star_border;
  IconData saveIcon = Icons.bookmark_border;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          if (isMenuOpen) {
            _closeMenu();
          }
        },
        child: Portal(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Details Page'),
              actions: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.share_outlined,
                    color: Color(0xFFE2D3F5),
                    size: 25,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: ScrollToHide(
              hideDirection: Axis.vertical,
              scrollController: _scrollController,
              child: BottomAppBar(
                height: MediaQuery.of(context).size.height * 0.066,
                notchMargin: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: LikeButton(
                            size: 27,
                            circleColor: const CircleColor(
                                start: Color(0xFFE2D3F5),
                                end: Color(0xFF6A0DAD)),
                            bubblesColor: const BubblesColor(
                              dotPrimaryColor: Color(0xFFE2D3F5),
                              dotSecondaryColor: Color(0xFF6A0DAD),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite,
                                color: isLiked
                                    ? Color(0xFF6A0DAD)
                                    : Color(0xFFE2D3F5),
                                size: 27,
                              );
                            },
                            likeCount: int.parse(widget.likes),
                            likeCountPadding: const EdgeInsets.only(left: 10),
                            countBuilder:
                                (int? count, bool isLiked, String text) {
                              final Color color = Color(0xFFE2D3F5);
                              Widget? result;
                              if (count == 0) {
                                result = Text(
                                  'love',
                                  style: TextStyle(color: color, fontSize: 17),
                                );
                              } else {
                                result = Text(
                                  text,
                                  style: TextStyle(color: color, fontSize: 17),
                                );
                              }
                              return result;
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.comment,
                                  size: 27, color: Color(0xFFE2D3F5))),
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(widget.comments,
                              style: TextStyle(
                                  fontFamily: 'Montesserat', fontSize: 17)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  saveIconColor =
                                      saveIconColor == Color(0xFFE2D3F5)
                                          ? Color(0xFF6A0DAD)
                                          : Color(0xFFE2D3F5);

                                  saveIcon = saveIcon == Icons.bookmark_border
                                      ? Icons.bookmark
                                      : Icons.bookmark_border;
                                });
                              },
                              icon: Icon(saveIcon,
                                  size: 27, color: saveIconColor)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('Save',
                              style: TextStyle(
                                  fontFamily: 'Montesserat',
                                  fontSize: 17,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    PortalTarget(
                      closeDuration: const Duration(milliseconds: 100),
                      visible: isMenuOpen,
                      child: IconButton(
                        onPressed: () {
                          debugPrint('Menu Opened');
                          setState(() {
                            isMenuOpen = !isMenuOpen;
                          });
                        },
                        icon: Icon(
                          Icons.more_vert,
                          size: 27,
                          color: Color(0xFFE2D3F5),
                        ),
                      ),
                      anchor: Aligned(
                        follower: Alignment.bottomRight,
                        target: Alignment.bottomRight,
                      ),
                      portalFollower: Container(
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.055,
                        ),
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(16),
                            child: IntrinsicWidth(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildMenuItem(
                                    title: 'Report',
                                    icon: Icons.report_outlined,
                                    onTap: () {
                                      debugPrint('Reported');
                                      _closeMenu();
                                    },
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    height:
                                        15, // Adds space above and below the divider
                                  ),
                                  _buildMenuItem(
                                    title: 'Unlike Post',
                                    icon: FontAwesomeIcons.heartBroken,
                                    onTap: () {
                                      debugPrint('Unliked');
                                      _closeMenu();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // ParallaxRain(
                  //   numberOfDrops: 80,
                  //   dropFallSpeed: 1,
                  //   dropColors: [
                  //     Color(0xFFE2D3F5),
                  //     Color(0xFF6A0DAD),
                  //     Colors.pink
                  //     // Colors.yellow,
                  //     // Colors.brown,
                  //     // Colors.blueGrey
                  //   ],
                  AnimateGradient(
                    
                    primaryColors: [
                      Color(0xFFE2D3F5),
                      Color(0xFF6A0DAD),
                    ],
                    secondaryColors: [
                      Color(0xFFDABFFF),
                      Color(0xFF45056E),
                    ],
                    duration: const Duration(seconds: 5),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.25,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.25,
                      ),

                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText(
                                  'Featured Blog',
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ComicaBoom',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                              stopPauseOnTap: true,
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              pause: const Duration(milliseconds: 1000),
                            ),
                          ),
                          Center(
                            child: Text(
                              widget.BlogName,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ComicaBoom',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 13,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.BlogDate,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montesserat',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                FontAwesomeIcons.book,
                                color: Colors.white,
                                size: 13,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${widget.ReadTimeCalc(widget.blogContent)} min read',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montesserat',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AvatarGlow(
                              glowRadiusFactor: 0.1,
                              startDelay: const Duration(milliseconds: 1000),
                              glowColor: Colors.white,
                              glowShape: BoxShape.circle,
                              curve: Curves.fastOutSlowIn,
                              child: ProfilePicture(
                                name: widget.BlogAuthor,
                                radius: 28,
                                fontsize: 25,
                                random: false,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.BlogAuthor,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Colors.white,
                                    fontFamily: 'Montesserat',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'u12345',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        color: Colors.white,
                                        fontFamily: 'Montesserat',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  starIconColor =
                                      starIconColor == Color(0xFFE2D3F5)
                                          ? Color(0xFF6A0DAD)
                                          : Color(0xFFE2D3F5);
                                  starIcon = starIcon == Icons.star_border
                                      ? Icons.star
                                      : Icons.star_border;
                                });
                              },
                              icon: Icon(
                                starIcon,
                                color: starIconColor,
                                size: MediaQuery.of(context).size.width * 0.08,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(widget.blogContent,
                            style: TextStyle(
                                fontFamily: 'Montesserat',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

Color getRandomColor({required String luminosity}) {
  final Random random = Random();

  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  if (luminosity == 'dark') {
    red = (red * 0.5).toInt();
    green = (green * 0.5).toInt();
    blue = (blue * 0.5).toInt();
  } else if (luminosity == 'light') {
    red = (red + 255) ~/ 2;
    green = (green + 255) ~/ 2;
    blue = (blue + 255) ~/ 2;
  }

  return Color.fromRGBO(red, green, blue, 1.0);
}

Widget _buildMenuItem({
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return ListTile(
    style: ListTileStyle.list,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    onTap: onTap,
    title: Text(
      title,
      style: const TextStyle(
        color: Color(0xFFE2D3F5),
        fontFamily: 'Montserrat',
        fontSize: 20,
      ),
    ),
    leading: Icon(icon, size: 22, color: Color(0xFFE2D3F5)),
    trailing: const Icon(Icons.keyboard_arrow_right_sharp,
        size: 22, color: Color(0xFFE2D3F5)),
  );
}
