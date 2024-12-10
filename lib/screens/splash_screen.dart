import 'package:QODE/screens/globals.dart';
import 'package:QODE/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'QODE',
                    style: GoogleFonts.poppins(
                      color: primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Learn Quran and\nRecite once everyday',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF4A628A),
                        ),
                        child: SvgPicture.asset('assets/svgs/splash_light.svg'),
                      ),
                      Positioned(
                        left: 0,
                        bottom: -23,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: lightBtn,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
