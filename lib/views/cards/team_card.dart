import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:takwira_app/data/team.data.dart';
import 'package:takwira_app/views/teams/team_details.dart';

class TeamCard extends ConsumerWidget {
  final bool team;
  const TeamCard({required this.team, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamData = ref.watch(teamDataProvider);
    bool member = false;

    double a = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double width(double width) {
      team == true ? a = width / 430 : a = width / 430 * 0.85;
      return screenWidth * a;
    }

    return Stack(
      children: [
        SizedBox(
          width: width(388),
          height: width(224),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/teamBg.png',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
          ),
        ),
        Positioned(
          top: width(39),
          left: width(159),
          child: Text(
            teamData.teamName,
            style: TextStyle(
              color: const Color(0xFFF1EED0),
              fontSize: width(12),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          width: width(388),
          child: Column(
            children: [
              SizedBox(height: width(72)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(20)),
                child: Text(
                  teamData.teamDescription,
                  style: TextStyle(
                    color: const Color(0xffF1EED0),
                    fontWeight: FontWeight.normal,
                    fontSize: width(10),
                  ),
                ),
              ),
              SizedBox(height: width(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/profileIcon.png',
                              width: width(54),
                              height: width(60),
                            ),
                            SizedBox(
                              width: width(54),
                              height: width(60),
                              child: Padding(
                                padding: EdgeInsets.all(width(10)),
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFF1EED0),
                        backgroundColor: const Color(0xFF599068),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width(5)),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: width(15),
                            vertical: width(10)), // button's shape
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeamDetails(),
                          ),
                        );
                      },
                      child: Text(
                        member == true
                            ? 'Details'
                            : teamData.playersNeeded != teamData.members
                                ? 'Join'
                                : 'Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: width(10)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(20)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearProgressBar(
                            maxSteps: teamData.playersNeeded,
                            progressType: LinearProgressBar.progressTypeLinear,
                            currentStep: teamData.members,
                            progressColor: const Color(0xff599068),
                            backgroundColor:
                                const Color(0xffF1EED0).withOpacity(0.3),
                          ),
                          SizedBox(height: width(4)),
                          Text(
                            '${teamData.members}',
                            style: TextStyle(
                              color: const Color(0xFFF1EED0),
                              fontWeight: FontWeight.normal,
                              fontSize: width(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: width(18)),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/jerseyNum.png',
                          width: width(24),
                          height: width(24),
                        ),
                        SizedBox(height: width(4)),
                        Text(
                          '${teamData.playersNeeded}',
                          style: TextStyle(
                            color: const Color(0xFFF1EED0),
                            fontWeight: FontWeight.normal,
                            fontSize: width(10),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
