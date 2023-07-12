import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'package:zar_app/views/widgets/dice_widget.dart';

class TwoDiceScreen extends StatefulWidget {
  const TwoDiceScreen({super.key, this.onSound, this.isEnglish});

  final onSound;
  final isEnglish;

  @override
  State<TwoDiceScreen> createState() => _TwoDiceScreenState();
}

int rightDiceNumber = 1;
int leftDiceNumber = 1;
bool onTap = false;
final player = AudioPlayer();

class _TwoDiceScreenState extends State<TwoDiceScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        elevation: 0.0,
        leading: IconButton(
          splashRadius: 0.1,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.1),
          child: InkWell(
            onTap: () {
              setState(() {
                onTap = true;
                if (widget.onSound) {
                  player.setAsset('assets/audio/rolling-dice.mp3');
                  player.play();
                }
                rightDiceNumber = Random().nextInt(6) + 1;
                leftDiceNumber = Random().nextInt(6) + 1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Dicee(count: leftDiceNumber),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Dicee(
                            count: rightDiceNumber,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      onTap
                          ? widget.isEnglish
                              ? "You rolled  ${rightDiceNumber + leftDiceNumber}"
                              : "Toplam  ${rightDiceNumber + leftDiceNumber}  attınız"
                          : widget.isEnglish
                              ? "Tap to roll"
                              : "Atmak için dokunun",
                      style: GoogleFonts.asapCondensed(
                        fontSize: onTap
                            ? 42.0
                            : widget.isEnglish
                                ? 47.0
                                : 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
