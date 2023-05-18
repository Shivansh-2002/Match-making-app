import 'package:ai_match_making_app/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 100,
              color: Colors.grey,
              child: const Text("Main Image"),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 80,
                  color: Colors.grey,
                  child: const Text("Image"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Online",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Koya University",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: const Icon(Icons.directions_car),
                  ),
                  const SizedBox(width: 4),
                  const Text("0 points "),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.directions_bus),
                  SizedBox(width: 4),
                  Text("0 points "),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.directions_walk),
                  SizedBox(width: 4),
                  Text("0 points "),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: const [
              Text("The distance from the first home ground set by your team")
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              // shape: Border.all(style: BorderStyle.solid, color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(width: 1, color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Trial Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTrialInfo("Schedule", "On April 22nd"),
                        _buildTrialInfo("Day time", "11:00 - 13:00"),
                        _buildTrialInfo("Trial meeting place",
                            "The team's first home ground"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Team Composition",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTrialInfo(
                          "Species", "High school student and nanshiki"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildLabeledBox("1 year old : 12"),
                      _buildLabeledBox("2 year old : 12"),
                      _buildLabeledBox("3 year old : 12"),
                      _buildLabeledBox("4 year old : 12"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildLabeledBox("5 year old : 12"),
                      _buildLabeledBox("6 year old : 12"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Home ground address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "2-butyl 7-39, Jonamoto Machi, Namashu Ward, Osaka, Osaka Prefecture",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ]),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 100,
              color: Colors.grey,
              // child: GoogleMap(
              //   initialCameraPosition: const CameraPosition(
              //     target: LatLng(34.6937, 135.5023), // San Francisco, CA
              //     zoom: 12,
              //   ),
              //   markers: {
              //     const Marker(
              //       markerId: MarkerId('marker_id'),
              //       position: LatLng(34.6937, 135.5023), // San Francisco, CA
              //     ),
              //   },
              // ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTrialInfo("Availabilty of parking lot", "There"),
                _buildTrialInfo("Nearest station", "en_小谷駅"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "One word.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  child: Text(
                    "I'm takano, the coach of the baseball department of otani high school. Our baseball team is not afraid to take on challenges and practice every day to bring out the best of their ability. We always aim for victory in practice matches, and we believe that the attitude of never giving up until the end will not only win the matches, but also bring great growth in the lives of the players.If you would like to play with otari high school baseball club, please contact us!We look forward to helping each other grow and building a good relationship through practice matches.",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Basic information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTrialInfo("School name", "Koya University"),
                      _buildTrialInfo("Represenative Name", "Hiroyuki Takano"),
                      _buildTrialInfo("Number of members", "30 people"),
                      _buildTrialInfo("Practice frequency", "Everyday"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "School address (may be different from home ground)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "2-butyl 7-39, Jonamoto Machi, Namashu Ward, Osaka, Osaka Prefecture",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTrialInfo("Availabilty of parking lot", "There"),
                      _buildTrialInfo("Nearest station", "Otani Station"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
              MaterialPageRoute(builder: (context) => const EditProfilePage()),
            );
          },
          child: const Text(
            'Edit your profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  Widget _buildTrialInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledBox(String label) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          width: 1.0,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          // Text(value,
          // style: const TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 10,
          //   ),),
        ],
      ),
    );
  }
}
