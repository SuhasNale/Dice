// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'dice_game.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MaterialApp(
      home: UserHome(),
    ));

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  TextEditingController p1Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();

  String fname = "";
  String sname = "";

  rulesDialog() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ready to play?\nKnow the Rules:'),
          content: SingleChildScrollView(
            child: new ListBody(
              children: const [
                Text(
                    '1. Both the players will get 6 turns.\n 2. Player who get max of 6 will be the winner.'),
              ],
            ),
          ),
          actions: [
            new ElevatedButton(
              child: const Text('Start'),
              onPressed: () {
                setState(() {
                  p1Controller.text = "";
                  p2Controller.text = "";
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DiceGame(
                        p1Name: fname,
                        p2Name: sname,
                      );
                    }),
                  );
                });
              },
            ),
          ],
        );
      },
    );
  }

  void showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.yellow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dice Game',
            style: TextStyle(
                letterSpacing: 3,
                fontSize: 40,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[400],
          // elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.tealAccent, Colors.lightGreen],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(150, 100),
                        // bottomLeft: Radius.elliptical(0, 100),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Text(
                          'Welcome to the',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            letterSpacing: 2,
                            fontFamily: 'DancingScript',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/images/dice0.png',
                          // scale: 2,
                          width: 200,
                          height: 140,
                        ),
                        const Text(
                          'Game  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            letterSpacing: 2,
                            fontFamily: 'DancingScript',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 40,
                            ),
                            Icon(
                              Icons.games_outlined,
                              color: Colors.white,
                              size: 38.0,
                            ),
                            Text(
                              ' Players ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 55.0,
                                letterSpacing: 2,
                                fontFamily: 'DancingScript',
                              ),
                            ),
                            Icon(
                              Icons.games_outlined,
                              color: Colors.white,
                              size: 38.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.lightGreen, Colors.tealAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // begin: Alignment.topRight,
                      // end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(150, 100),
                      // topLeft: Radius.elliptical(0, 100),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Player 1 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          letterSpacing: 2,
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: TextFormField(
                          controller: p1Controller,
                          textCapitalization: TextCapitalization.words,
                          style:
                              const TextStyle(color: Colors.teal, fontSize: 25),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.teal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Player 2 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          letterSpacing: 2,
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: TextFormField(
                          controller: p2Controller,
                          textCapitalization: TextCapitalization.words,
                          style:
                              const TextStyle(color: Colors.teal, fontSize: 25),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.teal,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (p1Controller.text == '' ||
                                p2Controller.text == '') {
                              showToast("Enter Names..!!!");
                            } else {
                              fname = p1Controller.text;
                              sname = p2Controller.text;
                              rulesDialog();
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.keyboard_double_arrow_right_sharp,
                          size: 50,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ],
        ));
  }
}
