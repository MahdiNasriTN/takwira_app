import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:takwira_app/views/playerProfile/player_details.dart';
import 'package:takwira_app/views/playerProfile/player_posts.dart';
import 'package:takwira_app/views/playerProfile/player_profile_header.dart';
import 'package:takwira_app/views/playerProfile/player_quickies.dart';
import 'package:http/http.dart' as http;


class PlayerProfile extends StatefulWidget {
  final dynamic? playerData;
  const PlayerProfile({super.key , required this.playerData});

  @override
  State<PlayerProfile> createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;
  dynamic? user;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final username = widget.playerData?['username'];
    if (username != null) {
      try {
        final response = await http.get(Uri.parse('https://takwira.me/api/user?username=$username'));
        if (response.statusCode == 200) {
          final userData = jsonDecode(response.body);
          setState(() {
            user = userData;
          });
        } else {
          print('Failed to fetch user data: ${response.statusCode}');
        }
      } catch (e) {
        print('Failed to fetch user data: $e');
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerData = widget.playerData;
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
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/share.png'),
          ),
          const SizedBox(width: 5)
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate([
                  PlayerProfileHeader(playerData : playerData, user : user),
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
                PlayerDetails(user : user),
                PlayerPosts(),
                PlayerQuickies(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
