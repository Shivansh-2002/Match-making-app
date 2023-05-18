import 'package:flutter/material.dart';
import 'package:ai_match_making_app/utils/constants.dart';
import 'package:ai_match_making_app/screens/profile/util_classes.dart';

class MatchingConditionScreen extends StatefulWidget {
  const MatchingConditionScreen({Key? key}) : super(key: key);
  @override
  MatchingConditionBuilder createState() => MatchingConditionBuilder();
}

class MatchingConditionBuilder extends State<MatchingConditionScreen> {
  List<TextEditingController> aboutOppositeTeamControllers =
      List.generate(2, (index) => TextEditingController());
  List<String> options = [];
  double _travelSliderVal = 50;
  double _trolleySliderVal = 50;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        
        children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            "Matching conditions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("About the opposite team",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            InputFieldWithOptions(
              options: options,
              labelText: "Education level",
            ),
            InputFieldWithOptions(
              options: options,
              labelText: "Academic year",
            ),
          ]),
        ),
        Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    "Mobile Whole",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(
                      "Maximum travel time",
                      style: TextStyle(fontSize: 16),
                    )),
                Card(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        travelSliderLevels[(_travelSliderVal ~/ 25)],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Slider(
                        value: _travelSliderVal,
                        min: 0,
                        max: 100,
                        divisions: 4,
                        label: travelSliderLevels[(_travelSliderVal ~/ 25)],
                        onChanged: (double value) {
                          setState(() {
                            _travelSliderVal = value;
                          });
                        }),
                  ]),
                ),
                InputFieldWithOptions(
                  options: options,
                  labelText: "Prefectures by prefecture",
                ),
                InputFieldWithOptions(
                  options: options,
                  labelText: "Urban village",
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Car movement",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            InputFieldWithOptions(
              options: options,
              labelText: "Specify",
            ),
            InputFieldWithOptions(
              options: options,
              labelText: "Availability of parking lot",
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "Trolley Movement",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 4),
                  child: Text(
                    "Walk from the station",
                    style: TextStyle(fontSize: 16),
                  )),
              Card(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      trolleySliderLevels[(_trolleySliderVal ~/ 25)],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Slider(
                      value: _trolleySliderVal,
                      min: 0,
                      max: 100,
                      divisions: 4,
                      label: trolleySliderLevels[(_trolleySliderVal ~/ 25)],
                      onChanged: (double value) {
                        setState(() {
                          _trolleySliderVal = value;
                        });
                      }),
                ]),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            padding:EdgeInsets.all(10),
            width: 220,
            height: 65,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey[600],
              ),
              child: const Text("Finished",style: TextStyle(fontSize: 16),),
            ),
          ),
        ),
      ]),
    );
  }
}
