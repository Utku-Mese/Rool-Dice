import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zar_app/views/screens/one_dice_screen.dart';
import 'package:zar_app/views/screens/two_dice_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool _onSound = true;

  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isEnglish = !_isEnglish;
                  Fluttertoast.showToast(
                    msg: "Language Changed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    backgroundColor: Colors.deepPurpleAccent,
                    fontSize: 16.0,
                  );
                });
              },
              child: Text(
                _isEnglish ? "TR" : "EN",
                style: GoogleFonts.asapCondensed(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              splashRadius: 0.1,
              onPressed: () {
                setState(() {
                  _onSound = !_onSound;
                  Fluttertoast.showToast(
                    msg: "Sound: ${_onSound ? "ON" : "OFF"}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    backgroundColor: Colors.deepPurpleAccent,
                    fontSize: 16.0,
                  );
                });
              },
              icon: FaIcon(
                _onSound
                    ? FontAwesomeIcons.volumeUp
                    : FontAwesomeIcons.volumeMute,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent,
              Color.fromARGB(255, 177, 148, 254)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isEnglish ? "Roll The Dice" : "Zar At",
              style: GoogleFonts.asapCondensed(
                letterSpacing: _isEnglish ? 0.0 : 8.0,
                fontSize: _isEnglish ? 70.0 : 90.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.white.withOpacity(0.8),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const FaIcon(
              FontAwesomeIcons.dice,
              size: 110.0,
              color: Colors.white,
            ),
            const SizedBox(
              height: 120.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white.withOpacity(0.8),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                elevation: MaterialStateProperty.all(8.0),
                shadowColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OneDiceScreen(
                      isEnglish: _isEnglish,
                      onSound: _onSound,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 12.0),
                child: Text(
                  _isEnglish ? "One Dice" : "  Tek Zar  ",
                  style: GoogleFonts.asapCondensed(
                    fontSize: 47.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white.withOpacity(0.8),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                elevation: MaterialStateProperty.all(8.0),
                shadowColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TwoDiceScreen(
                      isEnglish: _isEnglish,
                      onSound: _onSound,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 12.0),
                child: Text(
                  _isEnglish ? "Two Dice" : "  Çift Zar  ",
                  style: GoogleFonts.asapCondensed(
                    fontSize: 47.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
