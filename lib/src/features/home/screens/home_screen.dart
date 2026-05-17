import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/home/widgets/app_bar.dart';
import 'package:quiz_app/src/features/home/widgets/custom_button.dart';
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
      appBar: HomeAppBar(
        user: user,
        ontap: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
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
                  childAspectRatio: 0.8,
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
              CustomButton(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

