import 'dart:convert';
import 'dart:ffi';

import 'package:blog_app_frontend/Ai.dart';
import 'package:blog_app_frontend/addPost.dart';
import 'package:blog_app_frontend/custom_widget.dart';
import 'package:blog_app_frontend/featuredBlog.dart';
import 'package:blog_app_frontend/loginOrSignup.dart';
import 'package:blog_app_frontend/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Testing extends StatefulWidget {
  final String username;
  final String userId;

  Testing({super.key, required this.username, required this.userId});

  Future<List<List<List<String>>>> fetchAllBlogs() async {
    final response = await http.get(Uri.parse('YOUR_API_URL'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<List<List<String>>> blogs = [];

      for (var blog in jsonData) {
        blogs.add([
          [blog['title']], // Title
          [blog['summary']], // Summary
          [blog['content']], // Content
          [blog['author']], // Author
          [blog['date']], // Date
          List<String>.from(blog['categories']), // Categories
          [blog['likes'].toString()], // Likes
          [blog['comments'].toString()] // Comments
        ]);
      }

      return blogs;
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  final List<List<List<String>>> Blogs = [
    [
      ['Is a Dream Job a Destination or a Journey?'],
      ['My dream job isn’t a fixed destination but an evolving journey.'],
      [
        'What’s your dream job? \n\nMy dream job isn’t a fixed destination but an evolving journey. From teaching to public service and now consulting for Nytt AB Sweden, each role has shaped my aspirations.\n\nToday, I find fulfillment in blending innovation, collaboration, and inspiring others through my blog, Rise&Inspire. My dream job is about doing what I love, staying true to my values, and constantly learningWhen I look back at my career journey, I realize that my dream job wasn’t a fixed goal but a series of evolving aspirations.\n\nStarting as a young Assistant Professor, I saw teaching as my passion. It was only when I joined the public service that I discovered my calling in policy-making and administration.\n\nMy tenure as the Special Law Secretary for the Government of Kerala was a defining chapter in my career. It was a role that demanded a deep understanding of governance, legal frameworks, and the nuances of implementing systems that work for the greater good. Serving as a Consultant for the Kerala State Beverages Corporation and later as a member of the Kerala State Commission for Backward Classes further strengthened my understanding of public service and policy impact.One of my proudest moments was drafting Kerala’s Intellectual Property Rights Policy.\n\nIt wasn’t just about the policy itself but about the collective effort of ensuring our state took a progressive step in the national arena. Awards and recognitions, like the Kerala State e-Governance Award, were gratifying, but the satisfaction of seeing a tangible impact was unmatched.Today, as a Consultant for Nytt AB Sweden, I find joy in innovation and collaboration. Yet, a significant part of my fulfilment comes from writing for Rise&Inspire. Through blogging, Ive found a platform to motivate, reflect, and connect with others who share a vision for growth and positivity.For me, the essence of a dream job is not in the accolades or positions but in doing what I love, staying true to my values, and constantly learning.\n\nMy journey is far from over, and my dream continues to evolve.'
      ],
      ['John Doe'],
      ['12 Dec 2022'],
      ['Career', 'Dream Job'],
      ['305'],
      ['120']
    ],
    [
      ['Exploring the Potential of Blockchain Technology'],
      [
        'Blockchain technology is one of the most revolutionary innovations of the 21st century, with the potential to disrupt various industries.'
      ],
      [
        'Blockchain, originally designed as the technology behind cryptocurrencies like Bitcoin, has evolved far beyond that. It now offers a decentralized, secure, and transparent way to store and manage data. The applications of blockchain technology span across industries such as finance, supply chain, healthcare, and real estate. Through smart contracts, trust can be automated, transactions can be secured, and inefficiencies can be minimized. With the integration of blockchain, businesses can ensure data integrity, streamline processes, and open up new revenue streams. However, its adoption also comes with challenges, including regulatory concerns, scalability, and the need for a more sustainable consensus mechanism. As blockchain continues to develop, its impact on society and business will be profound, offering transformative potential that requires careful consideration and innovative approaches to ensure it benefits everyone.'
      ],
      ['Jane Smith'],
      ['20 Jan 2023'],
      ['Technology', 'Blockchain'],
      ['305'],
      ['120']
    ],
    [
      ['Understanding Cloud Computing'],
      [
        'Cloud computing has revolutionized how businesses store, manage, and access data.'
      ],
      [
        'Cloud computing has become an essential part of modern business operations, offering a range of benefits that include cost savings, scalability, and flexibility. By leveraging cloud services, businesses can reduce their reliance on physical infrastructure, which in turn lowers maintenance costs and capital expenditures. This shift allows companies to allocate resources more efficiently and focus on their core competencies. One of the primary advantages of cloud computing is its scalability. Traditional IT infrastructure often requires significant investment in hardware and software, which can be both costly and time-consuming to upgrade. In contrast, cloud services offer a pay-as-you-go model, allowing businesses to scale their resources up or down based on demand. This flexibility is particularly beneficial for startups and small businesses that may experience fluctuating workloads.Another key benefit of cloud computing is its ability to enhance collaboration and productivity. Cloud-based tools and applications enable employees to access data and work on projects from anywhere with an internet connection. This accessibility fosters a more collaborative work environment, as team members can easily share files, communicate in real-time, and collaborate on documents. Additionally, cloud services often come with built-in security features, such as encryption and multi-factor authentication, which help protect sensitive data from unauthorized access. Cloud computing also supports business continuity and disaster recovery efforts. By storing data in the cloud, businesses can ensure that their information is backed up and accessible even in the event of a hardware failure or natural disaster. Many cloud service providers offer automated backup solutions and redundancy measures, which help minimize downtime and data loss. This level of reliability is crucial for maintaining operations and protecting a companys reputation.Moreover, cloud computing enables businesses to leverage advanced technologies such as artificial intelligence (AI) and machine learning (ML). These technologies can be used to analyze large datasets, identify patterns, and make data-driven decisions. For example, AI-powered analytics tools can help businesses optimize their supply chain, improve customer service, and enhance marketing strategies. By integrating AI and ML into their operations, companies can gain a competitive edge and drive innovation.Despite its numerous benefits, cloud computing also presents certain challenges. One of the primary concerns is data security and privacy. While cloud service providers implement robust security measures, businesses must also take steps to protect their data. This includes implementing strong access controls, regularly updating software, and educating employees about cybersecurity best practices. Additionally, companies must ensure that they comply with relevant regulations and industry standards, such as the General Data Protection Regulation (GDPR) and the Health Insurance Portability and Accountability Act (HIPAA).Another challenge is the potential for vendor lock-in. When a business relies heavily on a single cloud service provider, it may become difficult to switch to another provider or move data back on-premises. To mitigate this risk, companies should consider adopting a multi-cloud strategy, which involves using services from multiple providers. This approach not only reduces dependency on a single vendor but also allows businesses to take advantage of the unique features and pricing models offered by different providers.Furthermore, cloud computing can introduce latency issues, particularly for applications that require real-time processing. While cloud providers are continually improving their infrastructure to reduce latency, businesses must carefully evaluate their network requirements and choose a provider that can meet their performance needs. In some cases, a hybrid cloud approach, which combines on-premises infrastructure with cloud services, may be the best solution.In conclusion, cloud computing offers a wide range of benefits that can help businesses improve efficiency, reduce costs, and drive innovation. By leveraging cloud services, companies can scale their resources, enhance collaboration, and ensure business continuity. However, it is essential to address the challenges associated with data security, vendor lock-in, and latency to fully realize the potential of cloud computing. As technology continues to evolve, cloud computing will undoubtedly play a critical role in shaping the future of business operations and digital transformation.'
      ],
      ['Emily Johnson'],
      ['15 Feb 2023'],
      ['Technology', 'Cloud Computing'],
      ['289'],
      ['110']
    ],
    [
      ['The Rise of Cybersecurity in Digital Age'],
      [
        'In the digital era, cybersecurity has become a critical aspect of protecting personal and sensitive information.'
      ],
      [
        'As technology advances, the risk of cyberattacks has also increased. Cybersecurity is essential to safeguard data, networks, devices, and applications from unauthorized access, theft, and damage. With the rise of cloud computing, IoT, and remote work, securing digital assets has become a top priority for individuals, businesses, and governments alike. Cybersecurity measures such as firewalls, encryption, multi-factor authentication, and security awareness training are crucial to preventing breaches and data leaks. As cyber threats continue to evolve, so too must the strategies and tools used to defend against them. The collaboration between technology and cybersecurity professionals will play a key role in mitigating risks and ensuring safer digital environments.'
      ],
      ['Michael Brown'],
      ['22 Mar 2023'],
      ['Technology', 'Cybersecurity'],
      ['310'],
      ['95']
    ],
    [
      ['Advancements in Artificial Intelligence'],
      [
        'Artificial Intelligence (AI) is transforming industries and paving the way for smarter, more efficient systems.'
      ],
      [
        'The field of AI has rapidly progressed in recent years, impacting sectors such as healthcare, finance, automotive, and entertainment. Machine learning algorithms, natural language processing, computer vision, and robotics are some of the key advancements driving innovation. AI systems can now perform complex tasks like diagnosing diseases, predicting market trends, and automating routine processes. However, AI’s capabilities come with ethical concerns, particularly regarding bias, job displacement, and privacy. As AI technology continues to advance, ensuring responsible development, transparency, and human oversight will be crucial to harnessing its full potential without adverse consequences.'
      ],
      ['Sarah Lee'],
      ['5 Apr 2023'],
      ['Technology', 'Artificial Intelligence'],
      ['280'],
      ['102']
    ],
    [
      ['The Future of Smart Home Technology'],
      [
        'Smart home devices are becoming an integral part of modern living, offering convenience and automation.'
      ],
      [
        'Smart home technology integrates various devices like thermostats, security cameras, lighting systems, and voice assistants into a cohesive network that can be controlled remotely. These devices enhance the convenience of daily life, allowing users to automate routine tasks, monitor home security, and manage energy consumption. With advancements in IoT (Internet of Things), smart homes are becoming more intelligent, offering personalized experiences based on user preferences. However, concerns about data privacy, interoperability, and system vulnerabilities need to be addressed for these technologies to gain broader acceptance. As smart home devices continue to evolve, their integration into everyday life will make homes smarter, more secure, and energy-efficient.'
      ],
      ['Tom Wilson'],
      ['18 May 2023'],
      ['Technology', 'Smart Home'],
      ['295'],
      ['85']
    ],
    [
      ['The Impact of 5G on Mobile Connectivity'],
      [
        '5G technology is transforming mobile networks, enabling faster speeds, lower latency, and greater connectivity.'
      ],
      [
        'The fifth generation of wireless technology, 5G, is set to revolutionize mobile connectivity with its enhanced speeds, increased capacity, and lower latency. This technology is expected to power innovations such as smart cities, autonomous vehicles, augmented reality, and the Internet of Things (IoT). 5G networks offer data rates up to 100 times faster than 4G, supporting the increasing demand for high-bandwidth applications. Additionally, 5G’s low latency makes real-time applications more feasible. However, the deployment of 5G comes with challenges such as infrastructure costs, potential health concerns, and cybersecurity risks. As 5G networks expand globally, they will significantly reshape communication, commerce, and digital experiences in unprecedented ways.'
      ],
      ['Chris Thompson'],
      ['25 Jun 2023'],
      ['Technology', '5G'],
      ['320'],
      ['120']
    ]
  ];

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> with TickerProviderStateMixin {
  int _tabIndex = 2;
  late PageController pageController;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
    debugPrint(widget.fetchAllBlogs().toString());
  }

  void onPageChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              style: ListTileStyle.drawer,
              textColor: Color(0xFFE2D3F5),
              iconColor: Color(0xFFE2D3F5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 35.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/blog.png',
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => myProfile(
                                  username: widget.username,
                                  userId: widget.userId)));
                    },
                    leading: Icon(Icons.account_circle_rounded, size: 25),
                    title: Text(
                      'Profile',
                      style: TextStyle(fontSize: 22, fontFamily: 'ComicaBoom'),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.bookmark_border, size: 25),
                    title: Text(
                      'Saved',
                      style: TextStyle(fontSize: 22, fontFamily: 'ComicaBoom'),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.settings, size: 25),
                    title: Text(
                      'Settings',
                      style: TextStyle(fontSize: 22, fontFamily: 'ComicaBoom'),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.feedback_outlined, size: 25),
                    title: Text(
                      'Feedback',
                      style: TextStyle(fontSize: 22, fontFamily: 'ComicaBoom'),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginOrSignup()));
                    },
                    leading: Icon(Icons.logout, size: 25),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 22, fontFamily: 'ComicaBoom'),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Write-Sphere',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montesserat',
                            color: Color(0xFFE2D3F5))),
                  ),
                ],
              ),
            ),
          ),
        ),
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 16.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            bottomNavigationBar: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: CircleNavBar(
                  height: 70,
                  activeIcons: const [
                    Icon(FontAwesomeIcons.plus,
                        color: Color(0xFFE2D3F5), size: 35),
                    Icon(Icons.chat, color: Color(0xFFE2D3F5), size: 35),
                    Icon(Icons.home, color: Color(0xFFE2D3F5), size: 35),
                    Icon(Icons.favorite, color: Color(0xFFE2D3F5), size: 35),
                    Icon(Icons.search, color: Color(0xFFE2D3F5), size: 35),
                  ],
                  inactiveIcons: const [
                    Icon(FontAwesomeIcons.plus,
                        color: Color(0xFF1D1B20), size: 35),
                    Icon(Icons.chat_outlined,
                        color: Color(0xFF1D1B20), size: 35),
                    Icon(Icons.home_outlined,
                        color: Color(0xFF1D1B20), size: 35),
                    Icon(Icons.favorite_outline,
                        color: Color(0xFF1D1B20), size: 35),
                    Icon(Icons.search_outlined,
                        color: Color(0xFF1D1B20), size: 35),
                  ],
                  color: Color(0xFF6A0DAD),
                  circleWidth: 70,
                  activeIndex: _tabIndex,
                  onTap: (index) {
                    setState(() {
                      _tabIndex = index;
                    });
                    pageController.jumpToPage(index);
                  },
                  padding: const EdgeInsets.all(0),
                  elevation: 10,
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: const Color(0xFF6A0DAD),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: Color(0xFFE2D3F5),
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => myProfile(
                                username: widget.username, userId: 'u12345')));
                  },
                ),
              ],
              title: const Text(
                'Write-Sphere',
                style: TextStyle(
                  fontFamily: 'ComicaBoom',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE2D3F5),
                ),
              ),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 85),
                child: PageView(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  children: [
                    _buildAddBlogPage(),
                    _AIhelper(),
                    buildHomePage(),
                    _buildFavoritesPage(),
                    _searchPage()
                  ],
                ),
              ),
            )));
  }

  Widget buildHomePage() {
    return RefreshIndicator(
      color: const Color(0xFFE2D3F5),
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          print('Refreshed');
        });
      },
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        children: [
          const SizedBox(height: 10),
          FeaturedBlog(
            blogId: 'b67890',
            BlogName: 'The Evolution of Artificial Intelligence',
            BlogContentPreview:
                'Artificial Intelligence (AI) has undergone significant transformations over the decades. Initially, AI was limited to simple rule-based systems that could perform basic tasks.',
            blogContent:
                'Artificial Intelligence (AI) has come a long way since its inception. From the early days of simple algorithms to the complex neural networks of today, AI has evolved significantly. The journey of AI began in the 1950s with the development of the first AI programs that could perform tasks such as playing chess and solving mathematical problems. These early programs were based on simple rule-based systems and lacked the ability to learn from experience.\n\nIn the 1980s, the field of AI saw a major breakthrough with the development of machine learning algorithms. These algorithms allowed computers to learn from data and improve their performance over time. This was a significant step forward as it enabled AI systems to handle more complex tasks and adapt to new situations. The introduction of neural networks in the 1990s further revolutionized the field. Neural networks, inspired by the human brain, allowed AI systems to process large amounts of data and recognize patterns with high accuracy.\n\nThe 21st century has witnessed an explosion in AI research and applications. The advent of big data and powerful computing resources has enabled the development of deep learning algorithms, which are capable of processing vast amounts of data and making predictions with unprecedented accuracy. AI is now being used in a wide range of applications, from self-driving cars and virtual assistants to medical diagnosis and financial forecasting.\n\nDespite these advancements, AI still faces several challenges. One of the biggest challenges is the issue of bias in AI systems. Since AI algorithms learn from data, they can inadvertently learn and perpetuate biases present in the data. This can lead to unfair and discriminatory outcomes. Another challenge is the lack of transparency in AI decision-making processes. Many AI systems, especially deep learning models, operate as black boxes, making it difficult to understand how they arrive at their decisions.\n\nLooking ahead, the future of AI holds immense potential. Researchers are working on developing explainable AI systems that can provide insights into their decision-making processes. There is also a growing focus on ethical AI, which aims to ensure that AI systems are fair, transparent, and accountable. As AI continues to evolve, it will undoubtedly play a crucial role in shaping the future of technology and society.',
            BlogAuthor: 'Alice Green',
            BlogDate: '10 Oct 2023',
            blogGenre: ['Technology', 'Artificial Intelligence'],
            likes: '450',
            comments: '200',
          ),
          ListView.builder(
            itemCount: widget.Blogs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BlogPreview(
                blogId: 'b12345',
                BlogName: widget.Blogs[index][0][0],
                BlogContentPreview: widget.Blogs[index][1][0],
                blogContent: widget.Blogs[index][2][0],
                BlogAuthor: widget.Blogs[index][3][0],
                BlogDate: widget.Blogs[index][4][0],
                blogGenre: widget.Blogs[index][5],
                likes: widget.Blogs[index][6][0],
                comments: widget.Blogs[index][7][0],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddBlogPage() {
    return AddBlog();
  }

  Widget _buildFavoritesPage() {
    return Center(
      child: Text(
        'Favorites Page',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Widget _searchPage() {
    bool isFilled = false;
    TabController tabController = TabController(length: 4, vsync: this);
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.topCenter,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  isFilled = value.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Blogs',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE2D3F5)),
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFFE2D3F5)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TabBar(
            labelColor: Color(0xFFE2D3F5),
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              fontFamily: 'Montesserat',
              fontWeight: FontWeight.bold,
            ),
            controller: tabController,
            tabs: [
              Tab(icon: Icon(Icons.arrow_upward, size: 20), text: 'Top'),
              Tab(icon: Icon(Icons.new_releases, size: 20), text: 'Latest'),
              Tab(icon: Icon(Icons.person, size: 20), text: 'Authors'),
              Tab(icon: Icon(Icons.category, size: 20), text: 'Genres'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _buildTopBlogs(context, searchController, isFilled),
                Center(
                  child: Icon(Icons.new_releases,
                      size: 150, color: Color(0xFFE2D3F5)),
                ),
                Center(
                  child:
                      Icon(Icons.person, size: 150, color: Color(0xFFE2D3F5)),
                ),
                Center(
                  child:
                      Icon(Icons.category, size: 150, color: Color(0xFFE2D3F5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBlogs(BuildContext context,
      TextEditingController searchController, bool isFilled) {
    return Container(
      child: isFilled
          ? Center(
              child: Text(
                'Search Results for "${searchController.text}"',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Center(
              child: Image.asset(
                'assets/images/errorimg.png',
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ),
    );
  }
}

Widget _AIhelper() {
  return Container();
}
