import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/features/home/widgets/app_bar.dart';
import 'package:quiz_app/src/features/home/widgets/home_topics.dart';
import 'package:quiz_app/src/features/home/widgets/info_card.dart';
import 'package:quiz_app/src/features/home/widgets/mini_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> homeTopics = [
    {
      "name": "Flutter",
      "image": "assets/images/flut.png",
      "maxPuzzle": 15,
      "solved": 12,
      "imageColor": const Color(0xFF3B82F6).withAlpha(100),
      "percentColor": const Color(0xFF60A5FA),
    },
    {
      "name": "Python",
      "image": "assets/images/phy.png",
      "maxPuzzle": 15,
      "solved": 7,
      "imageColor": const Color(0xFFEAB308).withAlpha(100),
      "percentColor": const Color(0xFFEAB308),
    },
    {
      "name": "React",
      "image": "assets/images/react.png",
      "maxPuzzle": 15,
      "solved": 3,
      "imageColor": const Color(0xFF22D3EE).withAlpha(100),
      "percentColor": const Color(0xFF22D3EE),
    },
    {
      "name": "Go",
      "image": "assets/images/go.png",
      "maxPuzzle": 15,
      "solved": 1,
      "imageColor": const Color(0xFF135BEC).withAlpha(100),
      "percentColor": const Color(0xFF135BEC),
    },
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.black, // appcolors.shark oqilmadi muammo chiqdi
      appBar: HomeAppBar(user: user),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              HomeInfoCard(date: 10, level: 8, xp: 240),
              const SizedBox(height: 32),
              SeeAllWidget(text: 'Your Topics', onPressed: () {}),
              const SizedBox(height: 16),
              GridView.builder(
                itemCount: homeTopics.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (_, int index) {
                  final item = homeTopics[index];
                  return HomeTopicCard(
                    name: item["name"],
                    image: Image.asset(item["image"]),
                    maxPuzzle: item["maxPuzzle"],
                    solved: item["solved"],
                    imageColor: item["imageColor"],
                    percentColor: item["percentColor"],
                  );
                },
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blue.withAlpha(120),
                      offset: Offset(0, 18),
                      blurRadius: 25,
                      spreadRadius: -5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0XFF22D3EE).withAlpha(100),
                      ),
                      child: Icon(
                        Icons.play_circle_outline_outlined,
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Up Next',
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: AppColors.white.withAlpha(120),
                          ),
                        ),
                        Text(
                          'Advanced Flutter Hooks',
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 24,)
                  ],
                ),
              ),
              const SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
