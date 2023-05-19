import 'package:flutter/material.dart';
import '../../reusable_widgets/reusable_widgets.dart';
import '../match/match_making.dart';



List<matchMakingCard> combination = [
  matchMakingCard(
      'April 22nd',
      'wrfsaf University',
      '9:00-11:00',
      true,
      'address of the university',
      '15 point',
      '15 point',
      '16 point',
      1,
      '10',
      '1',
      '3'),
  matchMakingCard(
      'April 23rd',
      'Miyajima University',
      '13:00-15:00',
      true,
      'address of the university',
      '50 point',
      '15 point',
      '35 point',
      1,
      '12 win',
      '2 loss',
      '5 point'),
  matchMakingCard(
      'April 23rd',
      'Sakuragawa high School',
      '15:00-17:00',
      true,
      'address of the university',
      '65 point',
      '15 point',
      '25 point',
      1,
      '2 win',
      '1 loss',
      '3 point'),
  matchMakingCard(
      'April 25th',
      'Koya university',
      '17:00-19:00',
      true,
      'address of the university',
      '25 point',
      '55 point',
      '15 point',
      2,
      '6',
      '1',
      '3'),
  matchMakingCard(
      'April 29th',
      'Hanada University',
      '12:00-14:00',
      true,
      'address of the university',
      '15 point',
      '45 point',
      '85 point',
      3,
      '6',
      '1',
      '3'),
  matchMakingCard(
      'April 30th',
      'Haruzaki University',
      '9:00-11:00',
      true,
      'address of the university',
      '35 point',
      '35 point',
      '5 point',
      2,
      '6',
      '1',
      '3'),
  matchMakingCard(
      'May 3rd',
      'Koya university',
      '16:00-18:00',
      true,
      'address of the university',
      '10 point',
      '25 point',
      '12 point',
      1,
      '6',
      '1',
      '3'),
  matchMakingCard(
      'May 6th',
      'Haruzaki University',
      '14:00-16:00',
      true,
      'address of the university',
      '15 point',
      '10 point',
      '18 point',
      1,
      '6',
      '1',
      '3'),
];

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                text: 'Established Match',
              ),
              Tab(
                text: 'Communication',
              ),
            ],
          ),
          title: const Text(
            'Message',
            style: TextStyle(
                fontSize: 24, color: Colors.black),
          ),


        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < combination.length; i++) ...[
                      GestureDetector(
                        onTap: () {
                          print("hello");
                        },
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              )),
                          child: Column(
                            children: [
                              head_scheduled_match_card(
                                  dateOfGame: combination[i].dateOfGame,
                                  timeOfMatch: combination[i].timeOfMatch,
                                  weather: combination[i].weather),
                              middle_scheduled_match_card(
                                  universityName: combination[i].opponentName,
                                  address: combination[i].address),
                              distance(
                                  carDistance: combination[i].carDistance,
                                  trainDistance: combination[i].trainDistance,
                                  walkDistance: combination[i].walkDistance),
                              imageAndScore(
                                  win: combination[i].win,
                                  loss: combination[i].loss,
                                  point: combination[i].point),
                              // const bottom(),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(60, 0, 60, 5),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    color: Colors.blue[900],
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 15, 50, 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Send a message',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            // IncomingPage(),
            Column(
              children: [
                for(int i =0; i<list_message_block.length;i++)
                  Message_block(list_message_block[i].university_name
                      , list_message_block[i].last_message_time,
                      list_message_block[i].last_message,
                      list_message_block[i].number_of_unseen_message),
              ],
            ),
            // OutgoingPage(),
          ],
        ),
      ),
    );
  }
}

List<Message_info> list_message_block = [
  const Message_info(university_name: "Miyajima University", last_message_time: "12:38", last_message: "Please take care of me!", number_of_unseen_message: "3"),
  const Message_info(university_name: "Shimada University", last_message_time: "8:02", last_message: "The call time is 1:04", number_of_unseen_message: "0"),
  const Message_info(university_name: "Ikeda High School", last_message_time: "3/28", last_message: "I think we'll be there in about 30 minutes", number_of_unseen_message: "0"),
  const Message_info(university_name: "Shioya High School", last_message_time: "3/25", last_message: "I'll also confirm it here. Yo...", number_of_unseen_message: "0"),
];
class Message_info extends StatefulWidget {
  const Message_info({Key? key, required this.university_name, required this.last_message_time, required this.last_message, required this.number_of_unseen_message }) : super(key: key);
  final String university_name;
  final String last_message_time;
  final String last_message;
  final String number_of_unseen_message;

  @override
  State<Message_info> createState() => _Message_infoState();
}

class _Message_infoState extends State<Message_info> {
  @override
  Widget build(BuildContext context) {
    return Message_block(widget.university_name, widget.last_message_time, widget.last_message, widget.number_of_unseen_message);
  }
}

Widget Message_block(String university_name, String last_message_time,
    String last_message, String number_of_unseen_message) {
  String text_req = "";
  int tt = 40;
  if(last_message.length<40) tt = last_message.length;
  for(int i =0;i<tt;i++)
    text_req += last_message[i];
  last_message = text_req;
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset("dummy2.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        university_name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        last_message_time,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(last_message,),



                      if(number_of_unseen_message!="0")
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.black,
                          child: Text(number_of_unseen_message,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white),),
                        ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}

