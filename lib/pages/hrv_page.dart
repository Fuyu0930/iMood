import 'package:flutter/material.dart';
import 'white_noise_page.dart';
import 'game_page.dart';
import 'meditation_page.dart';
import 'home_page.dart';
import '../widgets/line_chart_widget.dart';
import '../widgets/weekly_line_chart_widget.dart';
import 'focus_meditation_page.dart';
import 'sea_video_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HRVPage extends StatefulWidget {
  const HRVPage({super.key});

  @override
  State<HRVPage> createState() => _HRVPageState();
}

// In the widget, we have four components:
// explaination: today's score and how hrv works
// today score: today's score trending, represented by line chart
// week score: this week's score trending, represented by line chart
// conclusion: the conlusion based on the overall score
class _HRVPageState extends State<HRVPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My Status',
          style: TextStyle(
            fontFamily: 'CrimsonText',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Container(
          alignment: Alignment.topCenter,
          child: Center(
            child: ListView(
              children: [
                InputState(),
                // Explaination(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class InputState extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<InputState> {
  String text = '/';
  String output = '';
  bool shouldDisplay = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          title: const Text(
                            'What is HRV?',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSerif',
                              fontSize: 25,
                            ),
                          ),
                          content: const Text(
                            "\t\t\t\tHeart rate variability (HRV) refers to the fluctuations between consecutive heartbeat cycles. HRV analysis plays an important role in emotional study and detection.\n\n\t\t\t\tiMood will detect user's heart rate data via wearable devices like bluetooth watches. The system will calculate a score based on the data and algorithm to check whether the user is stressful or not.\n\n\t\t\t\tiMood will only read users heart rate data. You can view the privacy consents by clicking 'view privacy consents' button below.",
                            style: TextStyle(
                              fontFamily: 'IBMPlexSerif',
                              fontSize: 15,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Veiw Privacy Consent',
                                style: TextStyle(
                                  fontFamily: 'IBMPlexSerif',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontFamily: 'IBMPlexSerif',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.info_outline_rounded),
                    ),
                  ),
          const Text(
            'The Heart Rate Dataset',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontFamily: 'CrimsonText',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              Expanded(
                child: Column(children: [
                  const Text(
                    "Heart Rate",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Column(children: [
                  const Text(
                    "RMSSD",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              Expanded(
                child: Column(children: [
                  const Text(
                    "SDNN",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Column(children: [
                  const Text(
                    "pNN50",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              Expanded(
                child: Column(children: [
                  const Text(
                    "LF ratio",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Column(children: [
                  const Text(
                    "HF ratio",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              Expanded(
                child: Column(children: [
                  const Text(
                    "HF Power",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Column(children: [
                  const Text(
                    "LF power",
                    style: TextStyle(fontSize: 15, fontFamily: 'CrimsonText', fontWeight: FontWeight.bold,),
                  ),
                  TextField(
                    onChanged: (value) {
                      _doSomething(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.black), // Sets the background color to blue
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'CrimsonText',
                color: Colors.white,
              ),
            ),
            onPressed: () {
              setState(() {
                output = "You are stressed.";
                /*sendRequest();
                fetchData().then((data) {
                  // Process the fetched data
                  print(data);
                }).catchError((error) {
                  // Handle any errors that occurred during the request
                  print(error);
                });*/
              });
            },
          ),
          Center(
            child: SizedBox(
              width: 320,
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    output,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'CrimsonText',
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Text(text)
        ],
      ),
    );
  }

  void _doSomething(String value) {
    text = text + value + '/';
  }

  /*void sendRequest() async {
    var url = '';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Request successful, process the response
      var responseBody = response.body;
      // Handle the response data
    } else {
      // Request failed, handle the error
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> fetchData() async {
    var url = Uri.parse('https://api.example.com/data');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Request successful, parse the response body
      var data = jsonDecode(response.body);
      // Return the parsed data
      return data;
    } else {
      // Request failed, throw an error or return null
      throw Exception('Failed to fetch data from server.');
    }
  }*/
}


/*
// We integrated many widgets like card, container, column to make a card that can show today's score and how hrv works
class Explaination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.topCenter,
      child: Center(
        child: SizedBox(
          width: 380,
          height: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.blueGrey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We use onTap, InkWell, showDialog to build a button that
                  // when users click it, it will show up a dialog box that
                  // having the information of how HRV works in iMood and how iMood
                  // collect users' data
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          title: const Text(
                            'What is HRV?',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSerif',
                              fontSize: 25,
                            ),
                          ),
                          content: const Text(
                            "\t\t\t\tHeart rate variability (HRV) refers to the fluctuations between consecutive heartbeat cycles. HRV analysis plays an important role in emotional study and detection.\n\n\t\t\t\tiMood will detect user's heart rate data via wearable devices like bluetooth watches. The system will calculate a score based on the data and algorithm to check whether the user is stressful or not.\n\n\t\t\t\tiMood will only read users heart rate data. You can view the privacy consents by clicking 'view privacy consents' button below.",
                            style: TextStyle(
                              fontFamily: 'IBMPlexSerif',
                              fontSize: 15,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Veiw Privacy Consent',
                                style: TextStyle(
                                  fontFamily: 'IBMPlexSerif',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontFamily: 'IBMPlexSerif',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.info_outline_rounded),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: const Center(
                      child: Text(
                        "Today's Score: 16 \nStatus: Overloaded",
                        style: TextStyle(
                          fontFamily: 'IBMPlexSerif',
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.asset(
                      'assets/images/Bar.png',
                      height: 80.0,
                      width: 400.0,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

// In today's score, we will use a line chart to represent the trending
// Tutorial of using building line chart reference: https://youtu.be/LB7B3zudivI
class TodayScore extends StatefulWidget {
  const TodayScore({super.key});

  @override
  State<TodayScore> createState() => _TodayScore();
}

// We will set up the design layout by integrating different widgets
// Then call LineChartWidget() to build up the chart
class _TodayScore extends State<TodayScore> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 400,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.blueGrey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Daily Score Trending",
                  style: TextStyle(
                    fontFamily: 'PTSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 340,
                    child: LineChartWidget(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// We will set up the design layout by integrating different widgets
// Then call WeeklyLineChartWidget() to build up the chart
// Tutorial of using building line chart reference: https://youtu.be/LB7B3zudivI
class WeekScore extends StatefulWidget {
  const WeekScore({super.key});

  @override
  State<WeekScore> createState() => _WeekScoreState();
}

class _WeekScoreState extends State<WeekScore> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 400,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Weekly Score Trending",
                  style: TextStyle(
                    fontFamily: 'PTSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 340,
                    child: WeeklyLineChartWidget(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Set up the conclusion by using the widgets like card, column, container, etc.
// For the conclusion, in the demo, we typed the conclusion by using Text().
class Conclusion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 380,
        height: 400,
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.blueGrey, //<-- SEE HERE
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  'Overall Diagnose',
                  style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                alignment: Alignment.topLeft,
                child: const Text(
                  '\t\t\t\tBased on the weekly and daily HRV tests, we found you are heavily overloaded. The weekly score shows your emotion have a declining trend. In addition, the score on Thursday is the lowest, which is only 12.0.\n',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSerif',
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                alignment: Alignment.topLeft,
                child: const Text(
                  '\t\t\t\tTherefore, according to your HRV data and previous application experience, we recommend you to take a 10-minute focused meditation or watching white noise videos while working.\n\n\t\t\t\tClick our recommendations below and wish you can enjoy them:\n',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSerif',
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0),
                ),
              ),
              // In this container, when users click the text, it will go to the focus meditation page automatically.
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FocusMeditationPage(),
                      ),
                    );
                  },
                  child: const Text(
                    '\t\t\t\tFocus Meditation>>',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'IBMPlexSerif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // In this container, when users click the text, it will go to the sea video page automatically.
              Container(
                padding: const EdgeInsets.all(9.0),
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SeaVideoPage(),
                      ),
                    );
                  },
                  child: const Text(
                    '\t\t\t\tSea White Noise>>',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'IBMPlexSerif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
