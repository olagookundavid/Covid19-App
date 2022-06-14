import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map? worldData;

  const WorldwidePanel({Key? key, required this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: <Widget>[
        StatusPanel(
          title: 'CONFIRMED CASES',
          panelColor: Colors.blueGrey,
          count: worldData!['cases'].toString(),
        ),
        StatusPanel(
          title: 'TODAY\'S CASES',
          panelColor: Colors.grey,
          count: worldData!['todayCases'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.lightBlue,
          count: worldData!['active'].toString(),
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green,
          count: worldData!['recovered'].toString(),
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.black87,
          count: worldData!['deaths'].toString(),
        ),
        StatusPanel(
          title: 'TODAY\'S DEATHS',
          panelColor: Colors.redAccent,
          count: worldData!['todayDeaths'].toString(),
        ),
        StatusPanel(
          title: 'CRITICAL',
          panelColor: Colors.red,
          count: worldData!['critical'].toString(),
        ),
        StatusPanel(
          title: 'AFFECTED COUNTRIES',
          panelColor: Colors.grey,
          count: worldData!['affectedCountries'].toString(),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key? key,
      required this.panelColor,
      required this.title,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          Text(
            count,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class WorldwidePanelWeb extends StatelessWidget {
  final Map? worldData;

  const WorldwidePanelWeb({Key? key, required this.worldData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 2),
      children: <Widget>[
        StatusPanel(
          title: 'CONFIRMED CASES',
          panelColor: Colors.blueGrey,
          count: worldData!['cases'].toString(),
        ),
        StatusPanel(
          title: 'TODAY\'S CASES',
          panelColor: Colors.grey,
          count: worldData!['todayCases'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.lightBlue,
          count: worldData!['active'].toString(),
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green,
          count: worldData!['recovered'].toString(),
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.black87,
          count: worldData!['deaths'].toString(),
        ),
        StatusPanel(
          title: 'TODAY\'S DEATHS',
          panelColor: Colors.redAccent,
          count: worldData!['todayDeaths'].toString(),
        ),
        StatusPanel(
          title: 'CRITICAL',
          panelColor: Colors.red,
          count: worldData!['critical'].toString(),
        ),
        StatusPanel(
          title: 'AFFECTED COUNTRIES',
          panelColor: Colors.grey,
          count: worldData!['affectedCountries'].toString(),
        ),
      ],
    );
  }
}
