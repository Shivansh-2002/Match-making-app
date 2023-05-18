import 'package:flutter/material.dart';
import '../../reusable_widgets/reusable_widgets.dart';
import '../match/match_making.dart';


List<matchMakingCard> requested_team = [
  matchMakingCard('April 22nd', 'wrfsaf University','9:00-11:00', true, 'address of the university', '15 point', '15 point', '16 point', 1,'10 win', '1 loss', '3 point'),
  matchMakingCard('April 23rd', 'Miyajima University', '13:00-15:00', true, 'address of the university', '50 point', '15 point', '35 point',1, '12 win','2 loss','5 point'),
  matchMakingCard('April 23rd', 'Sakuragawa high School', '15:00-17:00', true, 'address of the university', '65 point', '15 point', '25 point',1, '2 win','1 loss', '3 point'),
  matchMakingCard('April 25th', 'Koya university','17:00-19:00', true, 'address of the university', '25 point', '55 point', '15 point',2, '6 win','1 loss', '3 point'),
  matchMakingCard('April 29th', 'Hanada University', '12:00-14:00',true, 'address of the university', '15 point', '45 point', '85 point',3,'6 win','1 loss', '3 point'),
  matchMakingCard('April 30th', 'Haruzaki University', '9:00-11:00',true, 'address of the university', '35 point', '35 point', '5 point',2,'6 win','1 loss', '3 point'),
  matchMakingCard('May 3rd', 'Koya university', '16:00-18:00',true, 'address of the university', '10 point', '25 point', '12 point',1,'6 win','1 loss', '3 point'),
  matchMakingCard('May 6th', 'Haruzaki University', '14:00-16:00',true, 'address of the university', '15 point', '10 point', '18 point',1,'6 win','1 loss', '3 point'),
];
List<matchMakingCard> registered_team = [
  matchMakingCard('April 22nd', 'Hanada University','9:00-11:00', true, 'address of the university', '15 point', '15 point', '16 point', 1,'10 win', '1 loss', '3 point'),
  matchMakingCard('April 23rd', 'Miyajima efw', '13:00-15:00', true, 'address of the university', '50 point', '15 point', '35 point',1, '12 win','2 loss','5 point'),
  matchMakingCard('April 23rd', 'Sakuragawa high School', '15:00-17:00', true, 'address of the university', '65 point', '15 point', '25 point',1, '2 win','1 loss', '3 point'),
  matchMakingCard('April 25th', 'Koya university','17:00-19:00', true, 'address of the university', '25 point', '55 point', '15 point',2, '6 win','1 loss', '3 point'),
  matchMakingCard('April 29th', 'Hanada University', '12:00-14:00',true, 'address of the university', '15 point', '45 point', '85 point',3,'6 win','1 loss', '3 point'),
  matchMakingCard('April 30th', 'Haruzaki University', '9:00-11:00',true, 'address of the university', '35 point', '35 point', '5 point',2,'6 win','1 loss', '3 point'),
  matchMakingCard('May 3rd', 'Koya university', '16:00-18:00',true, 'address of the university', '10 point', '25 point', '12 point',1,'6 win','1 loss', '3 point'),
  matchMakingCard('May 6th', 'Haruzaki University', '14:00-16:00',true, 'address of the university', '15 point', '10 point', '18 point',1,'6 win','1 loss', '3 point'),
];

class Request_manage extends StatefulWidget {
  const Request_manage({Key? key}) : super(key: key);

  @override
  State<Request_manage> createState() => _Request_manageState();
}

class _Request_manageState extends State<Request_manage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,

            bottom: const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Lists of Requests',

                ),
                Tab(
                  text: 'List of Registered Teams',

                ),

              ],

            ),

            title: const Text('Requests Management',
              style: TextStyle(fontSize: 24, color: Colors.black),)

        ),

        body:  TabBarView(
          children: [
            Center(
              child:Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        for(int i = 0;i<requested_team.length;i++)...[
                          GestureDetector(
                            onTap: (){
                              print("hello");
                            },
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                              child: Column(
                                children : [
                                  head_scheduled_match_card(dateOfGame: requested_team[i].dateOfGame, timeOfMatch: requested_team[i].timeOfMatch, weather: requested_team[i].weather),
                                  middle_scheduled_match_card(universityName: requested_team[i].opponentName, address: requested_team[i].address),
                                  distance(carDistance: requested_team[i].carDistance, trainDistance: requested_team[i].trainDistance, walkDistance: requested_team[i].walkDistance),
                                  imageAndScore(win: requested_team[i].win, loss: requested_team[i].loss, point: requested_team[i].point),
                                  // const bottom(),
                                  const Button(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // IncomingPage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        for(int i = 0;i<registered_team.length;i++)...[
                          GestureDetector(
                            onTap: (){
                              print("hello");
                            },
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                              child: Column(
                                children : [
                                  head_scheduled_match_card(dateOfGame: registered_team[i].dateOfGame, timeOfMatch: registered_team[i].timeOfMatch, weather: registered_team[i].weather),
                                  middle_scheduled_match_card(universityName: registered_team[i].opponentName, address: registered_team[i].address),
                                  distance(carDistance: registered_team[i].carDistance, trainDistance: registered_team[i].trainDistance, walkDistance: registered_team[i].walkDistance),
                                  imageAndScore(win: registered_team[i].win, loss: registered_team[i].loss, point: registered_team[i].point),
                                  // const bottom(),
                                  const Button(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // OutgoingPage(),
          ],
        ),

      ),

    );
  }
}
