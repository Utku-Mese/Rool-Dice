import 'dart:math';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zar_app/views/widgets/dice_widget.dart';

class OneDiceScreen extends StatefulWidget {
  const OneDiceScreen({
    super.key,
    this.onSound,
    this.isEnglish,
  });

  final onSound;
  final isEnglish;

  @override
  State<OneDiceScreen> createState() => _OneDiceScreenState();
}

int DiceNumber = 1;
bool onTap = false;
final player = AudioPlayer();

class _OneDiceScreenState extends State<OneDiceScreen> {
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
                DiceNumber = Random().nextInt(6) + 1;
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Dicee(count: DiceNumber),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      onTap
                          ? widget.isEnglish
                              ? "You rolled  $DiceNumber"
                              : "$DiceNumber  attın"
                          : widget.isEnglish
                              ? "Tap to roll"
                              : "Zar atmak için dokun",
                      style: GoogleFonts.asapCondensed(
                        fontSize: onTap
                            ? 47.0
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
