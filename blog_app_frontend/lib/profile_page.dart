import 'package:blog_app_frontend/loginOrSignup.dart';
import 'package:flutter/material.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';

class myProfile extends StatefulWidget {
  final String username;
  final String userId;

  final List<List<String>> myBlogs = [
    ['What About Increasing Genocide ? ', '12 jan 2024'],
    ['Sthephen Bartlett story?', '12 jan 2024'],
    ['The Future of AI', '15 Feb 2024'],
    ['Flutter vs React Native', '20 Mar 2024'],
    ['Understanding Null Safety in Dart', '25 Apr 2024'],
    ['Top 10 Programming Languages in 2024', '30 May 2024'],
    ['How to Build a Blog App with Flutter', '10 Jun 2024'],
  ];

  myProfile({super.key, required this.username, required this.userId});

  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'ComicaBoom',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE2D3F5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(children: [
                AvatarGlow(
                  glowRadiusFactor: 0.1,
                  startDelay: const Duration(milliseconds: 1000),
                  glowColor: Colors.white,
                  glowShape: BoxShape.circle,
                  curve: Curves.fastOutSlowIn,
                  child: ProfilePicture(
                    name: widget.username,
                    radius: 31,
                    fontsize: 21,
                    random: true,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.white,
                          fontFamily: 'Montesserat',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.userId,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 15,
                        )
                      ],
                    )
                  ],
                )
              ]),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  box(context, 'Favorites', 'favorite'),
                  box(context, 'Saved', 'saved'),
                  box(context, 'Activity', 'activity'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
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
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListTile(
                          style: ListTileStyle.list,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onTap: () => {},
                          title: const Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                          leading: const Icon(
                            Icons.settings,
                            size: 20,
                            color: Colors.white,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_sharp,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListTile(
                          style: ListTileStyle.list,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onTap: () => {
                            showModalBottomSheet(
                                showDragHandle: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: widget.myBlogs
                                                    .map((blog) =>
                                                        _buildMyBlogItems(
                                                            userName:
                                                                widget.username,
                                                            blogName: blog[0],
                                                            blogDate: blog[1],
                                                            onTap: () {}))
                                                    .toList(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                          },
                          title: const Text(
                            'My Blogs',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                          leading: const Icon(
                            FontAwesomeIcons.blog,
                            size: 20,
                            color: Colors.white,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_sharp,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListTile(
                          style: ListTileStyle.list,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onTap: () => {},
                          title: const Text(
                            'Support',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                          leading: const Icon(
                            Icons.question_mark_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_sharp,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListTile(
                  style: ListTileStyle.list,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginOrSignup()))
                  },
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.white,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right_sharp,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Widget box(context, String text, String iconName) {
  final iconMap = {
    'favorite': Icons.favorite_border_outlined,
    'saved': Icons.bookmark_border_outlined,
    'activity': Icons.access_time_outlined,
  };
  return Bounce(
    duration: const Duration(milliseconds: 100),
    child: GestureDetector(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width * 0.27,
          height: MediaQuery.of(context).size.height * 0.1,
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconMap[iconName],
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
            ],
          )),
    ),
  );
}

Widget _buildMyBlogItems({
  required String userName,
  required String blogName,
  required String blogDate,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Column(
      children: [
        ListTile(
          style: ListTileStyle.list,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onTap: onTap,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(children: [
                Text(
                  blogName,
                  maxLines: null,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 15),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Colors.white,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(blogDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                      )),
                ],
              )
            ],
          ),
          leading: ProfilePicture(
              name: userName, radius: 18, fontsize: 10, random: false),
          trailing: const Icon(Icons.keyboard_arrow_right_sharp,
              size: 30, color: Colors.white),
        ),
        Divider()
      ],
    ),
  );
}
