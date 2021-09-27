import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:ustam/models/provider.dart';
import 'package:ustam/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Ustam'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MapController controller = MapController();
  List<Provider> providers = [];

  void setCurrentLocation() async {
    // move camera to current location
    controller.move(await getCurrentPosition(), 15.0);
  }

  // search by using text
  void searchJobs(String text) async {
    showLoading(context);
    Future.delayed(const Duration(milliseconds: 1000), () {
      hideLoading(context);
      setState(() {
        for (int i = 0; i < 10; i++) {
          providers.add(Provider(
              i,
              "Nisan Coskun",
              "070-379-031",
              "Address",
              529.3,
              LatLng(45.521563, -122.677433),
              5,
              "Available",
              const NetworkImage("https://avatars.nisancoskun.com/a/nisan"),
              "Software Developer"));
        }
        // providers = getProviders();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
              mapController: controller,
              options:
                  MapOptions(center: LatLng(45.521563, -122.677433), zoom: 1),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
            child: Column(children: [
              Card(
                elevation: 10,
                child: TextField(
                  onSubmitted: searchJobs,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "What are you looking for?",
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              )
            ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(bottom: 48),
                height: 300,
                color: Colors.transparent,
                child: ListView(
                  padding: const EdgeInsets.only(left: 20),
                  children: providers.map((p) => p.buildCard(context)).toList(),
                  scrollDirection: Axis.horizontal,
                ),
              )),
        ],
      ),
    );
  }
}
