import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:ai_match_making_app/screens/profile/util_classes.dart';
import "package:ai_match_making_app/screens/profile/profile_screen.dart";
import 'package:ai_match_making_app/utils/constants.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  double currentSliderVal = 50;
  TextEditingController bioController = TextEditingController();
  List<TextEditingController> firstHomeControllers =
      List.generate(5, (index) => TextEditingController());
  List<TextEditingController> secondHomeControllers =
      List.generate(5, (index) => TextEditingController());
  List<TextEditingController> thirdHomeControllers =
      List.generate(5, (index) => TextEditingController());
  List<TextEditingController> teamCompositionControllers =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> basicInfoControllers =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> schoolAddressControllers =
      List.generate(5, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: ListView(children: [
        Padding(
            padding: const EdgeInsets.all(3.0),
            child: ImageBox(
              h: 200,
              w: MediaQuery.of(context).size.width*0.5,
            )),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              ImageBox(h: ScreenUtil.screenWidth!*multiplier*45, w: ScreenUtil.screenWidth!*multiplier*80),
              ImageBox(h: ScreenUtil.screenWidth!*multiplier*45, w: ScreenUtil.screenWidth!*multiplier*80),
              ImageBox(h: ScreenUtil.screenWidth!*multiplier*45, w: ScreenUtil.screenWidth!*multiplier*80),
              ImageBox(h: ScreenUtil.screenWidth!*multiplier*45, w: ScreenUtil.screenWidth!*multiplier*80),
              
            ],
          ),
        ),
        HomeGroundWidget(
            text: "first home ground (priority)",
            contentText: homeText,
            contentControllers: firstHomeControllers),
        HomeGroundWidget(
            text: "second home ground",
            contentText: homeText,
            contentControllers: secondHomeControllers),
        HomeGroundWidget(
            text: "third home ground",
            contentText: homeText,
            contentControllers: thirdHomeControllers),
        Padding(
          padding: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                "My team level",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Card(
              child: Column(children: [
                Text(sliderLevels[(currentSliderVal ~/ 25)]),
                Slider(
                    value: currentSliderVal,
                    min: 0,
                    max: 100,
                    divisions: 4,
                    label: sliderLevels[(currentSliderVal ~/ 25)],
                    onChanged: (double value) {
                      setState(() {
                        currentSliderVal = value;
                      });
                    }),
              ]),
            )
          ]),
        ),
        Content(text: "Team Composition", childrens: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BoxText(
                text: "School level",
                controller: teamCompositionControllers[0]),
          ),
          Card(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: InputFieldWithOptions(
                  options: academicYear,
                  labelText: homeText[3],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: basicInfoControllers[2],
                  decoration:
                      const InputDecoration(labelText: 'Number of members'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                ),
              ),
            ]),
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: const Text(
                "Bio",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: const Text(
                "within 10 to 300 words",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Card(
              child: TextField(
                controller: bioController,
                maxLength: 300,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Basic Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              ListText(
                  listControllers: basicInfoControllers.sublist(0, 2),
                  listStrings: const [
                    "School and teams",
                    "Representative name"
                  ]),
              TextField(
                controller: basicInfoControllers[2],
                decoration:
                    const InputDecoration(labelText: 'Number of members'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Setting school address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              ListText(
                  listControllers: schoolAddressControllers.sublist(0, 3),
                  listStrings: homeText.sublist(0, 3)),
              InputFieldWithOptions(
                options: const ["set", "unset"],
                labelText: homeText[3],
              ),
              BoxText(
                  text: homeText[4], controller: schoolAddressControllers[4]),
            ])),
      ]),
      floatingActionButton: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyProfilePage()),
            );
          },
          child: const Text(
            'Save your profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
