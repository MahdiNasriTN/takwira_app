import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takwira_app/data/field_data.dart';
import 'package:takwira_app/providers/follow.dart';

final followProvider = StateNotifierProvider<Follow, bool>(((ref) {
  return Follow();
}));

class FieldProfileHeader extends ConsumerWidget {
  final VoidCallback onBookNowPressed; // Callback function

  const FieldProfileHeader({super.key, required this.onBookNowPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldData = ref.watch(fieldDataProvider);
    final follow = ref.watch(followProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double a = 0;
    double width(double width) {
      a = width / 430;
      return screenWidth * a;
    }

    return Stack(
      children: [
        Positioned(
          top: width(13),
          left: width(2),
          child: SizedBox(
            width: width(428),
            height: width(187),
            child: Image.asset(
              'assets/images/fieldCover.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(2)),
          child: Image.asset(
            'assets/images/linear1.png',
            width: width(426),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width(2), width(13), width(2), 0),
          child: Image.asset(
            'assets/images/linear2.png',
            width: width(426),
          ),
        ),
        Image.asset(
          'assets/images/fieldProfile.png',
          width: screenWidth,
          height: width(261),
        ),
        Positioned(
          top: width(164),
          left: width(146),
          child: Image.asset(
            'assets/images/fieldProfilePhoto.png',
            width: width(134),
            height: width(84),
          ),
        ),
        Column(
          children: [
            SizedBox(height: width(277)),
            Row(
              children: [
                SizedBox(width: width(109)),
                Column(
                  children: [
                    Text(
                      '${fieldData.posts}',
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
                      '${fieldData.followersCount}',
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
                      '${fieldData.followingCount}',
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
                  fieldData.bio,
                  style: TextStyle(
                    color: const Color(0xFFF1EED0),
                    fontSize: width(10),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: width(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width(123),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width(9)),
                        ),
                        foregroundColor: follow == true
                            ? Color.fromARGB(255, 65, 134, 83)
                            : const Color(0xFF292929),
                        backgroundColor: follow == true
                            ? Color.fromARGB(255, 199, 195, 164)
                            : const Color(0xFF807E73),
                        padding: EdgeInsets.symmetric(
                            horizontal: width(15), vertical: width(13)),
                      ),
                      onPressed: () {
                        ref.read(followProvider.notifier).followPressed();
                      },
                      child: follow == true
                          ? Text(
                              'Follow',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: width(13),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Following',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width(12),
                                  ),
                                ),
                                SizedBox(width: width(3)),
                                Column(
                                  children: [
                                    SizedBox(height: width(2)),
                                    Image.asset(
                                      'assets/images/followingUp.png',
                                      width: width(12),
                                      height: width(12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(
                    width: width(123),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width(9)),
                        ),
                        foregroundColor: const Color(0xFFF1EED0),
                        backgroundColor: const Color(0xFF474D48),
                        padding: EdgeInsets.symmetric(
                            horizontal: width(15), vertical: width(13)),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Contact US',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width(123),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width(9)),
                        ),
                        foregroundColor: const Color(0xFFF1EED0),
                        backgroundColor: const Color(0xFF599068),
                        padding: EdgeInsets.symmetric(
                            horizontal: width(15), vertical: width(13)),
                      ),
                      onPressed: () {
                        onBookNowPressed();
                      },
                      child: Text(
                        'Book now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: width(20)),
          ],
        ),
      ],
    );
  }
}
