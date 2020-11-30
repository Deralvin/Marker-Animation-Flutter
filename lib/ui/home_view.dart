import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';



class HomeView extends StatefulWidget {
  static const String route = '/moving_markers';

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  Marker _marker;
  Timer _timer;
  int _markerIndex = 0;
  List<Marker> markers = new List();
  int markering = 0;
  Marker selectedMarker;

  List colors = [Colors.red, Colors.green, Colors.yellow,Colors.blue,Colors.deepOrange];
  Random random = new Random();
  @override
  void initState() {
    super.initState();
    _marker = _markers[_markerIndex];
    _timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        markering = (markering + 1) % data[0].length;
        markers.removeWhere((value) => value.height==42.0);
        for (int i = 0; i< data.length;i++){
          markers.add(Marker(
            width: 42.0,
            height: 42.0,
            point: LatLng(data[i][markering][0],data[i][markering][1]),
            builder: (ctx) => Container(
              child: FlutterLogo(

              ),
            ),
          ));
        }
        _markerIndex = (_markerIndex + 1) % _markers.length;
        selectedMarker = new Marker(
          width: 42.0,
          height: 42.0,
          point: data_bis[_markerIndex],
          builder: (ctx) => Container(
            child: FlutterLogo(),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
//      drawer: buildDrawer(context, MovingMarkersPage.route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(-6.925542, 107.598109),
                  zoom: 13.0,
                ),
                layers: [

                  TileLayerOptions(
                    tileProvider: CachedNetworkTileProvider(),
                    maxZoom: 20.0,
                    urlTemplate:
                    'http://vectormap.pptik.id/styles/klokantech-basic/{z}/{x}/{y}.png',
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  List<Marker> _markers = [
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.927220, 107.603813),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.927241, 107.604142),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.927307, 107.604787),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.927325, 107.605032),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.927361, 107.605538),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.927411, 107.605893),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.926891, 107.605978),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.926722, 107.605997),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
  Marker(
    width: 42.0,
    height: 42.0,
    point: LatLng(-6.926506, 107.606010),
    builder: (ctx) => Container(
      child: FlutterLogo(),
    ),
  ),
];
var data = [
  [
    [-6.927220, 107.603813],
    [-6.927241, 107.604142],
    [-6.927307, 107.604787],
    [-6.927325, 107.605032],
    [-6.927361, 107.605538],
    [-6.927411, 107.605893],
    [-6.926891, 107.605978],
    [-6.926722, 107.605997],
    [-6.926506, 107.606010]
  ],
  [
    [-6.913463, 107.610325],
    [-6.914146, 107.610291],
    [-6.914948, 107.610119],
    [-6.915886, 107.610119],
    [-6.916534, 107.609998],
    [-6.916261, 107.609363],
    [-6.916176, 107.609002],
    [-6.916296, 107.608452],
    [-6.915852, 107.607798]
  ],
  [
    [-6.937396, 107.605106],
    [-6.937478, 107.605755],
    [-6.937563, 107.606201],
    [-6.938112, 107.606142],
    [-6.939033, 107.606231],
    [-6.939776, 107.606441],
    [-6.940608, 107.606785],
    [-6.942124, 107.607239],
    [-6.942835, 107.607526]
  ],
  [
    [-6.937256, 107.602263],
    [-6.937355, 107.600700],
    [-6.937540, 107.599668],
    [-6.937768, 107.598263],
    [-6.937668, 107.596800],
    [-6.937327, 107.595811],
    [-6.936928, 107.595022],
    [-6.936387, 107.595323],
    [-6.935405, 107.595696]
  ]
] ;
List<LatLng> data_bis =  [LatLng(-6.927220, 107.603813),
  LatLng(-6.927241, 107.714142),
  LatLng(-6.927307, 107.714787),
  LatLng(-6.927325, 107.715032),
  LatLng(-6.927361, 107.715538),
  LatLng(-6.927411, 107.715893),
  LatLng(-6.926891, 107.715978),
  LatLng(-6.926722, 107.715997),
  LatLng(-6.926506, 107.716010)];

