class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/robotic-arm.png',
      titleTxt: 'Robot ARM',
      kacl: 525,
      meals: <String>['Control,', 'Change,', 'Fast'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/production.png',
      titleTxt: 'Production Line',
      kacl: 602,
      meals: <String>['Production,', 'Fast,', 'Deliver'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/conveyor-belt.png',
      titleTxt: 'Controle',
      kacl: 0,
      meals: <String>['Recommend:', '800 speed'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/delivery.png',
      titleTxt: 'Delivery',
      kacl: 0,
      meals: <String>['Recommend:', '703 Speed'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
