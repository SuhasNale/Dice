import 'package:flutter/material.dart';
import 'dart:math';
import 'constants.dart';

class DiceGame extends StatefulWidget {
  String p1Name = '';
  String p2Name = '';
  DiceGame({Key? key, required this.p1Name, required this.p2Name})
      : super(key: key);

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  // bool isEnabled = true;

  bool isPlayer1 = true;
  bool gameOver = false;

  int num1 = 0;
  int num2 = 0;
  int counter1 = 0;
  int counter2 = 0;

  String imgPath = "assets/images/dice0.png";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isPlayer1 = true;
    gameOver = false;
  }

  void rollDice1() {
    setState(() {
      num1 = Random.secure().nextInt(6) + 1;
      if (num1 == 6) {
        counter1++;
      }
      imgPath = "assets/images/dice$num1.png";
      Constants.playerOneList.add(num1);
      isPlayer1 = false;
      debugPrint(counter1.toString());
    });
  }

  void rollDice2() {
    setState(() {
      num2 = Random.secure().nextInt(6) + 1;
      if (num2 == 6) {
        counter2++;
      }
      imgPath = "assets/images/dice$num2.png";
      Constants.playerTwoList.add(num2);
      if (Constants.playerTwoList.length == 6) {
        gameOver = true;
      }
      isPlayer1 = true;
      debugPrint(counter2.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
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
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 60),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.tealAccent, Colors.lightGreen],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(30, 30),
                  bottomLeft: Radius.elliptical(30, 30),
                  topRight: Radius.elliptical(30, 30),
                  topLeft: Radius.elliptical(30, 30),
                ),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.height * 0.10,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.p1Name,
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 35.0,
                                letterSpacing: 2,
                                fontFamily: 'DancingScript',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Dice',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 35.0,
                                letterSpacing: 2,
                                fontFamily: 'DancingScript',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.p2Name,
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 35.0,
                                letterSpacing: 2,
                                fontFamily: 'DancingScript',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(15),
                                      primary: Colors.green,
                                      onPrimary: Colors.white,
                                      shadowColor: Colors.blueAccent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                      minimumSize: const Size(10, 20),
                                    ),
                                    onPressed: gameOver == false
                                        ? (isPlayer1 == true
                                            ? () => rollDice1()
                                            : null)
                                        : null,
                                    child: const Text(
                                      'Roll',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35.0,
                                        letterSpacing: 2,
                                        fontFamily: 'DancingScript',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),

                                //****************** DOESNT SHOWS THE DIASBLED BUTTON BUT CONTROLS THE FUNCTIONALITY ***********************/
                                // onPressed: () {
                                //   print("value of isPlayer1 is " +
                                //       isPlayer1.toString());

                                //   isPlayer1 == false ?rollDice2() : null;
                                // }
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        // padding: EdgeInsets.only(top: 20),
                        // height: MediaQuery.of(context).size.height / 6,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon(Icons.add_box_outlined),
                            Image.asset(
                              imgPath,
                              scale: 10,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        // height: MediaQuery.of(context).size.height / 6,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  primary: Colors.green,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.blueAccent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  minimumSize: const Size(10, 20),
                                ),

                                //****************** SHOWS THE DIASBLED BUTTON AND CONTROLS THE FUNCTIONALITY ***********************/
                                onPressed: gameOver == false
                                    ? (isPlayer1 == false
                                        ? () => rollDice2()
                                        : null)
                                    : null,
                                child: const Text(
                                  'Roll',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35.0,
                                    letterSpacing: 2,
                                    fontFamily: 'DancingScript',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )

                                //****************** DOESNT SHOWS THE DIASBLED BUTTON BUT CONTROLS THE FUNCTIONALITY ***********************/
                                // onPressed: () {
                                //   print("value of isPlayer1 is " +
                                //       isPlayer1.toString());

                                //   isPlayer1 == false ?rollDice2() : null;
                                // }
                                ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.height * 0.13,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              counter1.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                letterSpacing: 2,
                                fontFamily: 'DancingScript',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.height * 0.13,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            gameOver == false
                                ? (isPlayer1 == true
                                    ? const Text(
                                        '<-',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 65.0,
                                          letterSpacing: 2,
                                          fontFamily: 'DancingScript',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text(
                                        '->',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 65.0,
                                          letterSpacing: 2,
                                          fontFamily: 'DancingScript',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                : const Text(
                                    'Done',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      letterSpacing: 2,
                                      fontFamily: 'DancingScript',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.height * 0.13,
                        // color: Colors.blueAccent[400],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              counter2.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                letterSpacing: 2,
                                fontFamily: 'DancingScript',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: const Size(20, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        gameOver = false;
                        isPlayer1 = true;
                        Constants.playerOneList.clear();
                        Constants.playerTwoList.clear();
                        num1 = num2 = 0;
                        counter1 = 0;
                        counter2 = 0;
                        imgPath = "assets/images/dice0.png";
                      });
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        letterSpacing: 2,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    // color: Colors.blueAccent[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (gameOver == true)
                            ? const Text(
                                "Game Over",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35.0,
                                  letterSpacing: 2,
                                  fontFamily: 'DancingScript',
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                "Game in Progress",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35.0,
                                  letterSpacing: 2,
                                  fontFamily: 'DancingScript',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                        // (gameOver == true)
                        //     ? ((counter1 == counter2)
                        //         ? Text("Game is Drawn")
                        //         : (counter1 > counter2)
                        //             ? Text("Player 1 WINS")
                        //             : Text("Player 2 WINS"))
                        //     : Text("Game in Progress")

                        (gameOver == true)
                            ? (counter1 == counter2)
                                ? const Text(
                                    "Game is Drawn",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 35.0,
                                      letterSpacing: 2,
                                      fontFamily: 'DancingScript',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : (counter1 > counter2)
                                    ? Text(
                                        "${widget.p1Name} Wins",
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 35.0,
                                          letterSpacing: 2,
                                          fontFamily: 'DancingScript',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        "${widget.p2Name} Wins",
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 35.0,
                                          letterSpacing: 2,
                                          fontFamily: 'DancingScript',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                            : const Text("")

                        // (playerOneList.length == playerTwoList.length &&
                        //         playerOneList.length == 6)
                        //     ? ((counter1 > counter2)
                        //         ? ((counter1 == counter2)
                        //             ? Text("Game is Drawn")
                        //             : Text("Game in Progress"))
                        //         : Text("Player1 Wins"))
                        //     : Text("Game in Progress")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
