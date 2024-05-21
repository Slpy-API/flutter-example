import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart'; //was 'package:maplibre_gl/mapbox_gl.dart', but is now 'package:maplibre_gl/maplibre_gl.dart'

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slpy+MapLibre Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Slpy+MapLibre Flutter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const apiKey = "your_api_key"; //get your key at www.slpy.com
  static const mapLanguage = "en";
  static const startZoom = 3.0;
  static const center = LatLng(0, -0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MaplibreMap(
        styleString:
            "https://api.slpy.com/style/slpy-mgl-style.json?key=$apiKey&lang=$mapLanguage",
        myLocationEnabled: true,
        initialCameraPosition:
            const CameraPosition(target: center, zoom: startZoom),
        trackCameraPosition: true,
      ),
    );
  }
}
