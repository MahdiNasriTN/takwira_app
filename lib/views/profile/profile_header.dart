import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takwira_app/data/user_data.dart';
import 'package:takwira_app/views/cards/profile_card.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileData = ref.watch(userDataProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double a = 0;
    double width(double width) {
      a = width / 430;
      return screenWidth * a;
    }

    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: width(144),
          child: Image.asset(
            'assets/images/coverPhoto.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            SizedBox(height: width(60)),
            Row(
              children: [
                SizedBox(width: width(20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: width(120)),
                    Row(
                      children: [
                        Text(
                          'Rated',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontSize: width(10),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          ' ${profileData.rated} ',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontSize: width(10),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'times',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontSize: width(10),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: width(6)),
                        Image.asset(
                          'assets/images/rateIcon.png',
                          width: width(12),
                          height: width(12),
                        ),
                      ],
                    ),
                    SizedBox(height: width(6)),
                    Row(
                      children: [
                        Text(
                          '${profileData.motm} ',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontSize: width(10),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Man Of The Match',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontSize: width(10),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: width(6)),
                        Image.asset(
                          'assets/images/motmIcon.png',
                          width: width(12),
                          height: width(12),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: width(4)),
                ProfileCard(gameDataS : null),
                SizedBox(width: width(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: width(65)),
                    Text(
                      '@ ${profileData.username}',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(10),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: width(11)),
                    Row(
                      children: [
                        SizedBox(width: width(15)),
                        Text(
                          '${profileData.played} ',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontSize: width(10),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'played Games',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontSize: width(10),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: width(3)),
                    Row(
                      children: [
                        SizedBox(width: width(15)),
                        Text(
                          '${profileData.upcoming} ',
                          style: TextStyle(
                            color: const Color(0xFFBFBCA0),
                            fontSize: width(10),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'upcoming Games',
                          style: TextStyle(
                            color: const Color(0xFFBFBCA0),
                            fontSize: width(10),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: width(15)),
            Row(
              children: [
                SizedBox(width: width(109)),
                Column(
                  children: [
                    Text(
                      '${profileData.posts}',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: width(5)),
                    Text(
                      'Posts',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(12),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: width(49)),
                Column(
                  children: [
                    Text(
                      '${profileData.followersCount}',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: width(5)),
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(12),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: width(38)),
                Column(
                  children: [
                    Text(
                      '${profileData.followingCount}',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: width(5)),
                    Text(
                      'Following',
                      style: TextStyle(
                        color: const Color(0xFFF1EED0),
                        fontSize: width(12),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: width(37)),
            Row(
              children: [
                SizedBox(width: width(20)),
                Text(
                  profileData.bio,
                  style: TextStyle(
                    color: const Color(0xFFF1EED0),
                    fontSize: width(10),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: width(20)),
          ],
        ),
      ],
    );
  }
}
