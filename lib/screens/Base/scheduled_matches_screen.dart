import 'package:flutter/material.dart';
import '../Base/my_page.dart';


class OpponentInfo{
  String matchTime;
  String opponentSchoolName;
  bool mode;
  String matchLocation;

  OpponentInfo(this.matchLocation, this.opponentSchoolName, this.mode, this.matchTime){
    matchTime = matchTime;
    opponentSchoolName = opponentSchoolName;
    mode = mode;
    matchLocation = matchLocation;
  }
}

class Days{
  String date;
  List<OpponentInfo> listOfOpponent ;
  Days( this.date, this.listOfOpponent){
    date = date;
    listOfOpponent = listOfOpponent;
  }
}

List<Days> schedule = [
  Days('April 22nd',
      [
        OpponentInfo( 'Match location: the first home ground of the team','Hanada University' , true, '9:00-11:00' ),
        OpponentInfo( 'Match location: the first home ground of the team', 'Miyajima University', true,  '13:00-15:00'),
        OpponentInfo( 'Match location: the first home ground of the team', 'Sakuragawa high School', true,  '16:00-18:00')
      ]
  ),
  Days('April 23rd',
      [
        OpponentInfo( 'Match location: the first home ground of the team', 'Koya university', true,  '9:00-11:00'),
        OpponentInfo( 'Match location: the first home ground of the team','Haruzaki University', true,  '14:00-16:00'),
      ]
  ),
  Days('April 24th',
      [
        OpponentInfo( 'Match location: the first home ground of the team','Hanada University' , true, '9:00-11:00' ),
        OpponentInfo( 'Match location: the first home ground of the team', 'Miyajima University', true,  '13:00-15:00'),
        OpponentInfo( 'Match location: the first home ground of the team', 'Sakuragawa high School', true,  '16:00-18:00'),
        OpponentInfo( 'Match location: the first home ground of the team', 'Koya university', true,  '19:00-21:00')
      ]
  ),
  Days('April 25th',
      [
        OpponentInfo( 'Match location: the first home ground of the team','Hanada University' , true, '9:00-11:00' ),
        OpponentInfo( 'Match location: the first home ground of the team', 'Miyajima University', true,  '11:00-13:00'),
        OpponentInfo( 'Match location: the first home ground of the team', 'Sakuragawa high School', true,  '13:00-15:00'),
        OpponentInfo( 'Match location: the first home ground of the team', 'Koya university', true,  '15:00-17:00'),
        OpponentInfo( 'Match location: the first home ground of the team','Haruzaki University', true,  '17:00-19:00'),
      ]
  ),
];




// ignore: camel_case_types, must_be_immutable
class nextPage extends StatefulWidget{

  // ignore: prefer_const_constructors_in_immutables
  nextPage({super.key});

  @override
  State<nextPage> createState() => _nextPageState();
}

// ignore: camel_case_types
class _nextPageState extends State<nextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        title: const Text('Complete Schedule',style: TextStyle(color: Colors.black,fontSize: 24),),
      ),
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,10),
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              for(int i = 0; i<schedule.length; i++)
                MatchCard(dateItem: schedule[i].date,opponentList: schedule[i].listOfOpponent, ),
            ],
          ),
        ),
      ),

    );

  }
}

class MatchCard extends StatefulWidget {
  const MatchCard({Key? key, required this.dateItem, required this.opponentList, }) : super(key: key);
  final String dateItem;
  final List<OpponentInfo> opponentList;

  @override
  State<MatchCard> createState() => _AddingMatchState();
}

class _AddingMatchState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children:[
        AddingDate(dateItem: widget.dateItem),
        for(int i  = 0;i<widget.opponentList.length;i++)...[
          AddingTime(timeItem: widget.opponentList[i].matchTime),
          MyButton(iconData: Icons.abc_outlined, buttonText: widget.opponentList[i].opponentSchoolName),
        ]
      ],
    );
  }
}


// ignore: use_key_in_widget_constructors, camel_case_types
class historyOfGames extends StatefulWidget{
  // ignore: prefer_const_constructors_in_immutables
  historyOfGames({super.key});

  @override
  State<historyOfGames> createState() => _historyOfGamesState();
}

// ignore: camel_case_types
class _historyOfGamesState extends State<historyOfGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        title: const Text('History of Games',style: TextStyle(color: Colors.black,fontSize: 24),),
      ),
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,10),
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              for(int i = 0; i<schedule.length; i++)
                MatchCard(dateItem: schedule[i].date,opponentList: schedule[i].listOfOpponent, ),
            ],
          ),
        ),
      ),

    );

  }
}

