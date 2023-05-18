import 'package:ai_match_making_app/screens/profile/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Base/scheduled_matches_screen.dart';
import '../match/match_making.dart';
import 'package:ai_match_making_app/screens/match/matching_condtion.dart';
import '../requests/request_manage.dart';
import '../messages/message.dart';
import 'package:ai_match_making_app/screens/auth/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

Days firstDay = schedule[0];

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Page',
          style: TextStyle(
              color: Colors.black, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MatchingConditionScreen()));
                      
                      },
                      child: SizedBox(
                        height: 90,
                        width: 180,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  'handshake.png',
                                  width: 40.0,
                                  height: 30.0,
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  'Setting matching',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const Text(
                                  'condition',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Request_manage()));
                      },
                      child: SizedBox(
                        height: 90,
                        width: 180,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  'list.png',
                                  width: 30.0,
                                  height: 30.0,
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  'Setting available date',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const Text(
                                  'and time for match',
                                  style: TextStyle(fontSize: 12),
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
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MyProfilePage()));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            children: [
                              Image.asset(
                                'pen.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.contain,
                              ),
                              const Text(
                                'View and edit your profile',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Text(
                    'Game Schedule',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
              AddingDate(dateItem: firstDay.date),
              for (int i = 0; i < 3; i++) ...[
                AddingTime(timeItem: firstDay.listOfOpponent[i].matchTime),
                MyButton(
                    iconData: Icons.abc_outlined,
                    buttonText: firstDay.listOfOpponent[i].opponentSchoolName),
              ],
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => nextPage()));
                      },
                      child: Card(
                        color: Colors.blue[900],
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Text(
                            "I'll check all the schedules",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => historyOfGames()));
                        },
                        child: Container(
                          // color: Colors.grey[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Past game history',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          // color: Colors.grey[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Contact us',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Log out',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_ios)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddingDate extends StatefulWidget {
  const AddingDate({Key? key, required this.dateItem}) : super(key: key);
  final String dateItem;

  @override
  State<AddingDate> createState() => _AddingDateState();
}

class _AddingDateState extends State<AddingDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "On ${widget.dateItem}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        Divider(
          height: 10,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}

class AddingTime extends StatefulWidget {
  const AddingTime({Key? key, required this.timeItem}) : super(key: key);
  final String timeItem;

  @override
  State<AddingTime> createState() => _AddingTimeState();
}

class _AddingTimeState extends State<AddingTime> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.timeItem,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.iconData,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String buttonText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: GestureDetector(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                buttonText+"  ",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),

                              SizedBox(width: 6,),
                              Container(

                                height: 8,
                                width: 8,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(width: 3,),
                              const Text(
                                "Online",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),

                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Match location: the first home ground of the team',
                            style: TextStyle(fontSize: 12),
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
      ],
    );
  }
}
