import 'package:ai_match_making_app/screens/Base/home_screen.dart';
import 'package:ai_match_making_app/screens/Base/my_page.dart';
import 'package:flutter/material.dart';
import 'package:ai_match_making_app/screens/modals/info_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../reusable_widgets/reusable_widgets.dart';

// making class of variables which we required in the form of list in this format from firebase
// ignore: camel_case_types
class matchMakingCard{
  String dateOfGame;
  String opponentName;
  String timeOfMatch;
  bool mode;
  String address;
  String carDistance;
  String trainDistance;
  String walkDistance;
  int weather;
  String win;
  String loss;
  String point;
  matchMakingCard(this.dateOfGame, this.opponentName,this.timeOfMatch, this.mode, this.address, this.carDistance, this.walkDistance, this.trainDistance,
      this.weather, this.win, this.loss, this.point){
    dateOfGame = dateOfGame;
    opponentName = opponentName;
    timeOfMatch = timeOfMatch;
    mode = mode;
    trainDistance = trainDistance;
    walkDistance = walkDistance;
    carDistance = carDistance;
    address = address;
    weather = weather;
    // 1 is couldy, 2 is sunny, 3 is rainy
    win = win;
    loss = loss;
    point = point;
  }
}

// list which we require from fire base
List<matchMakingCard> matches = [
  matchMakingCard('April 22nd', 'Hanada University','9:00-11:00', true, 'address of the university', '15 point', '15 point', '16 point', 1,'10 win', '1 loss', '3 point'),
  matchMakingCard('April 23rd', 'Miyajima University', '13:00-15:00', true, 'address of the university', '50 point', '15 point', '35 point',1, '12 win','2 loss','5 point'),
  matchMakingCard('April 23rd', 'Sakuragawa high School', '15:00-17:00', true, 'address of the university', '65 point', '15 point', '25 point',1, '2 win','1 loss', '3 point'),
  matchMakingCard('April 25th', 'Koya university','17:00-19:00', true, 'address of the university', '25 point', '55 point', '15 point',2, '6 win','1 loss', '3 point'),
  matchMakingCard('April 29th', 'Hanada University', '12:00-14:00',true, 'address of the university', '15 point', '45 point', '85 point',3,'6 win','1 loss', '3 point'),
  matchMakingCard('April 30th', 'Haruzaki University', '9:00-11:00',true, 'address of the university', '35 point', '35 point', '5 point',2,'6 win','1 loss', '3 point'),
  matchMakingCard('May 3rd', 'Koya university', '16:00-18:00',true, 'address of the university', '10 point', '25 point', '12 point',1,'6 win','1 loss', '3 point'),
  matchMakingCard('May 6th', 'Haruzaki University', '14:00-16:00',true, 'address of the university', '15 point', '10 point', '18 point',1,'6 win','1 loss', '3 point'),
];

// top part of the scheduled match card
// ignore: camel_case_types
class head_scheduled_match_card extends StatefulWidget {
  const head_scheduled_match_card({Key? key, required this.dateOfGame, required this.timeOfMatch,required this. weather}) : super(key: key);
  final String dateOfGame;
  final String timeOfMatch;
  final int weather;
  @override
  // ignore: library_private_types_in_public_api
  _AddingMatchState createState() => _AddingMatchState();
}

class _AddingMatchState extends State<head_scheduled_match_card> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,10,5,5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Date of the game',
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Icon(
                  Icons.cloud_circle,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "On ${widget.dateOfGame}",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white, //<-- SEE HERE
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.blue[100],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,5,10,5),
                    child: Text(widget.timeOfMatch,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        )),
                  ),
                ),
                const SizedBox(width: 11,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


// ignore: camel_case_types
class middle_scheduled_match_card extends StatefulWidget {
  const middle_scheduled_match_card({Key? key, required this.universityName, required this.address,}) : super(key: key);
  final String universityName;
  final String address;
  @override
  // ignore: library_private_types_in_public_api
  _AddingMiddleScheduledMatchState createState() => _AddingMiddleScheduledMatchState();
}
class _AddingMiddleScheduledMatchState extends State<middle_scheduled_match_card> {
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
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      children: [

                        Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Online",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          widget.universityName,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                Icons.arrow_forward_ios)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          widget.address,
                          style: const TextStyle(fontSize: 12),
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
    );
  }
}

// ignore: camel_case_types
class distance extends StatefulWidget {
  const distance({Key? key, required this.carDistance, required this.trainDistance, required this.walkDistance,}) : super(key: key);
  final String carDistance;
  final String trainDistance;
  final String walkDistance;
  @override
  // ignore: library_private_types_in_public_api
  _AddingDistanceState createState() => _AddingDistanceState();
}


class _AddingDistanceState extends State<distance> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        const SizedBox(width: 10,),
        const Icon(
          Icons.directions_car,
          size: 20,
          color: Colors.black,
        ),
        Text(widget.carDistance),
        const SizedBox(width: 5,),
        const Icon(
          Icons.directions_train,
          size: 20,
          color: Colors.black,
        ),
        Text(widget.trainDistance),
        const SizedBox(width: 5,),
        const Icon(
          Icons.directions_walk,
          size: 20,
          color: Colors.black,
        ),
        Text(widget.walkDistance),
      ],
    ) ;
  }
}


// ignore: camel_case_types
class imageAndScore extends StatefulWidget {
  const imageAndScore({Key? key, required this.win, required this.loss, required this.point,}) : super(key: key);
  final String win;
  final String loss;
  final String point;
  @override
  // ignore: library_private_types_in_public_api
  _AddingImageAndScoreState createState() => _AddingImageAndScoreState();
}
class _AddingImageAndScoreState extends State<imageAndScore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'dummy.jpg',
            width:155.0,
            height: 155.0,
            fit: BoxFit.contain,
          ),
          // SizedBox(width: 10,),
          Column(
            children:  [
              const Text('Past Results'),
              const Divider(
                height: 15,
                color: Colors.red,
              ),

              Text("${widget.win} win ${widget.loss} loss ${widget.point} points" , style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.normal
              )
              )
            ],
          ),
          const SizedBox(width: 5,),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class bottom extends StatelessWidget {
  const bottom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[700],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Matching conditions for other team',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: SizedBox(
            width: 110,
             height: 40,
             child : PopUps(
              popUpWidget: PopUpsG1(popUpItems: [
                "April 22, 11:00 - 13:00",
                "from nakano.refused the request for the match",
                Icons.sentiment_very_dissatisfied,
                "",
                "Change matching conditions",
                "Close"
              ]),
              btnText: "Refuse",),
          ),

        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: SizedBox(
            width: 110,
            height: 40,
            child: PopUps(
              popUpWidget: PopUpsG1(popUpItems: [
                "April 22, 11:00 - 13:00",
                "With higashiharuzaki high school.The game is over",
                Icons.emoji_emotions,
                "I'll send you a message, Let's say hello",
                "Send a message",
                "Close"
              ]),
              btnText: "Admit",
            ),
          ),
          ),
        ],
    );
  }
}




class Match_making extends StatefulWidget {
  const Match_making({Key? key}) : super(key: key);

  @override
  State<Match_making> createState() => _Match_makingState();
}

class _Match_makingState extends State<Match_making> {
  @override
  Widget build(BuildContext context) {
    CollectionReference _matchCardData = FirebaseFirestore.instance.collection('Hello');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        centerTitle: true,
        backgroundColor: Colors.white,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: const Text(
                'Match-making',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),


            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort, color: Colors.black,)
              ),
            ),
            Expanded(
                flex: 1,
                child: Text("Sort",style: TextStyle(color: Colors.black, fontSize: 20),)),

          ],
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _matchCardData.doc("0sAoNWvzooHrvEapBWLa").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            // print(data.length);
            // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: [
                      for(int i = 0;i<data.length;i++)...[
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
                                head_scheduled_match_card(dateOfGame: data['0']['date'], timeOfMatch: data['0']['time'], weather: data['0']['mode']),
                                middle_scheduled_match_card(universityName: data['0']['university'], address: data['0']['address']),
                                distance(carDistance: data['0']['car'], trainDistance: data['0']['train'], walkDistance: data['0']['walk']),
                                imageAndScore(win: data['0']['win'], loss: data['0']['loss'], point: data['0']['points']),
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
            );

          }

          return Text("loading");
        },
      ),
    );
  }
}
