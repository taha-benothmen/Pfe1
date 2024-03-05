import 'package:best_flutter_ui_templates/fitness_app/Robotics/home_robots.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/Camera/camera_home_screen.dart';
import 'package:best_flutter_ui_templates/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.title = '',
    this.description = '',
  });

  Widget? navigateScreen;
  String imagePath;
  String title;
  String description;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
      title: 'Department 1',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: HotelHomeScreen(),
      title: 'Department 2',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: FitnessAppHomeScreen(),
      title: 'Department 3',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: DesignCourseHomeScreen(),
      title: 'Department 4',
    ),
  ];
}
