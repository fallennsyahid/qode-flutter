import 'package:QODE/screens/globals.dart';
import 'package:QODE/screens/splash_screen.dart';
import 'package:QODE/tabs/surah_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _greeting(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: const Color(0xFFAAAAAA).withOpacity(.1),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: _tab(),
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                SurahTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: const Color(0xFF8789A3),
        labelColor: const Color(0xFF4A628A),
        indicatorColor: const Color(0xFF4A628A),
        indicatorWeight: 3,
        tabs: [
          _tabItem(label: "Surah"),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: textLight,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Muslim/Muslimat',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF240F4F),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0,
                .6,
                1,
              ],
              colors: [
                Color(0xFF4A628A),
                Color(0xFF5E78A1),
                Color(0xFF748FB9),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset('assets/svgs/quran2.svg'),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              ),
              icon: SvgPicture.asset('assets/svgs/back-icon.svg'),
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              'QODE',
              style: GoogleFonts.poppins(
                color: primaryText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
            ),
          ],
        ),
      );
}
