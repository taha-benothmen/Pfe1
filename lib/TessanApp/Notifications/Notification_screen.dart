import 'package:best_flutter_ui_templates/TessanApp/Camera/camera_app_theme.dart';
import 'package:best_flutter_ui_templates/TessanApp/fitness_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class MyNotficationPage extends StatefulWidget {
  @override
  _MyNotficationPageState createState() => _MyNotficationPageState();
}

class _MyNotficationPageState extends State<MyNotficationPage> {
  List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 1',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 2',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 3',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 4',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 44),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 5',
      subtitle: 'We believe in the power of mobile computing.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getAppBarUI(),
            StackedNotificationCards(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 2.0,
                )
              ],
              notificationCardTitle: 'Message',
              notificationCards: [..._listOfNotification],
              cardColor: Color(0xFFF1F1F1),
              padding: 16,
              actionTitle: Text(
                'Improve The prodactivite of your factory',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showLessAction: Text(
                'Show less',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTapClearAll: () {
                setState(() {
                  _listOfNotification.clear();
                });
              },
              clearAllNotificationsAction: Icon(Icons.close),
              clearAllStacked: Text('Clear All'),
              cardClearButton: Text('clear'),
              cardViewButton: Text('view'),
              onTapClearCallback: (index) {
                print(index);
                setState(() {
                  _listOfNotification.removeAt(index);
                });
              },
              onTapViewCallback: (index) {
                print(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: HotelAppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 0, right: 0, top: 16 - 8.0, bottom: 12 - 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 10,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Notification',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 38,
                    width: 38,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {},
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: FitnessAppTheme.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                      right: 0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Icon(
                            Icons.calendar_today,
                            color: FitnessAppTheme.grey,
                            size: 18,
                          ),
                        ),
                        Text(
                          '15 May',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            letterSpacing: -0.2,
                            color: FitnessAppTheme.darkerText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    width: 38,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {},
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: FitnessAppTheme.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
