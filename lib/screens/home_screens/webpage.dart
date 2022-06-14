import 'package:covid_app/screens/home_screens/panels/world_wide_panel.dart';
import 'package:flutter/material.dart';
import '../../Sources/constants.dart';
import '../../Sources/datasource.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../country_screen/country_page.dart';
import 'panels/info_panel.dart';
import 'panels/most_affected.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _HomePageState();
}

class _HomePageState extends State<WebPage> {
  Map? worldData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List? countryData;
  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COVID-19 Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Worldwide',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CountryPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kprimaryBlack,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Regional',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? const CircularProgressIndicator()
                : WorldwidePanelWeb(worldData: worldData),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Most affected Countries',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),
            const InfoPanelWeb(),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              'WE ARE TOGETHER IN THE FIGHT\n   WITH LOVE FROM DAVID OH',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
            SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Copyright © 2022 | David-oH',
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 20,
                  ),
                ),
              ),
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
