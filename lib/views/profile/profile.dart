import 'package:flutter/material.dart';
import 'package:takwira_app/views/profile/profile_datails.dart';
import 'package:takwira_app/views/profile/profile_header.dart';
import 'package:takwira_app/views/profile/profile_posts.dart';
import 'package:takwira_app/views/profile/profile_quickies.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double a = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double width(double width) {
      a = width / 430;
      return screenWidth * a;
    }

    Widget selectedTab(String selected, String dselected,
        {required bool isSelected}) {
      return isSelected
          ? Image.asset(
              selected,
              width: width(32),
              height: width(32),
            )
          : Image.asset(
              dselected,
              width: width(32),
              height: width(32),
            );
    }

    return Scaffold(
      backgroundColor: const Color(0xff343835),
      appBar: AppBar(
        backgroundColor: const Color(0xff343835),
        iconTheme: const IconThemeData(color: Color(0xFFF1EED0)),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/edit.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/share.png'),
              ),
              const SizedBox(width: 5),
            ],
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate([
                  ProfileHeader(),
                ]),
              ),
            ];
          },
          body: Column(
            children: [
              Material(
                color: Colors.transparent,
                child: SizedBox(
                  height: width(41),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF415346),
                          Color(0xff343835),
                        ],
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      dividerColor: const Color(0xFF4E6955),
                      indicatorColor: const Color(0xFFF1EED0),
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      tabs: [
                        Tab(
                          icon: selectedTab(
                            'assets/images/detailsS.png',
                            'assets/images/details.png',
                            isSelected: selectedIndex == 0,
                          ),
                        ),
                        Tab(
                          icon: selectedTab(
                            'assets/images/postsS.png',
                            'assets/images/posts.png',
                            isSelected: selectedIndex == 1,
                          ),
                        ),
                        Tab(
                          icon: selectedTab(
                            'assets/images/videosS.png',
                            'assets/images/videos.png',
                            isSelected: selectedIndex == 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(controller: _tabController, children: [
                ProfileDetails(),
                ProfilePosts(),
                ProfileQuickies(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
