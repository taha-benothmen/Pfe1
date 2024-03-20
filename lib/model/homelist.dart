import 'package:best_flutter_ui_templates/TessanApp/Robotics/home_robots.dart';
import 'package:best_flutter_ui_templates/TessanApp/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/TessanApp/Camera/camera_home_screen.dart';
import 'package:best_flutter_ui_templates/TessanApp/Notifications/Notification_screen.dart';
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
      navigateScreen: MyNotficationPage(),
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
