import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:palmo/widgets/main_app_bar.dart';
import 'package:palmo/widgets/map_bottom_pill.dart';
import 'package:palmo/widgets/map_user.dart';

const LatLng SOURCE_LOCATION = LatLng(06.449324, 003.342602);
const LatLng DEST_LOCATION = LatLng(06.448671, 003.342560);
// const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
// const LatLng DEST_LOCATION = LatLng(42.744421, -71.1698939);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;

  late LatLng currentLocation;
  late LatLng destinationLocation;
  bool mapUserSelected = false;
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();

    //  set up initial locations
    setInitialLocation();
    // set up the marker icons
    setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/source_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/destination_pin.png');
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation = LatLng(
      DEST_LOCATION.latitude,
      DEST_LOCATION.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    const CameraPosition initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: true,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              polylines: _polylines,
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onTap: (LatLng loc) {
                // tapping on the map will dismiss the bottom pill
                setState(() {
                  pinPillPosition = PIN_INVISIBLE_POSITION;
                  mapUserSelected = false;
                });
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);

                showPinsOnMap();
                setPolylines();
              },
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: MapUser(
              isSelected: mapUserSelected,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: pinPillPosition,
            child: const MapBottomPill(),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainAppBar(
              showProfilePic: false,
            ),
          ),
        ],
      ),
    );
  }

  void showPinsOnMap() {
    setState(
      () {
        _markers.add(
          Marker(
            markerId: const MarkerId('sourcePin'),
            position: currentLocation,
            icon: sourceIcon,
            onTap: () {
              setState(() {
                mapUserSelected = true;
              });
            },
          ),
        );

        _markers.add(
          Marker(
            markerId: const MarkerId('destinationPin'),
            position: destinationLocation,
            icon: destinationIcon,
            onTap: () {
              setState(() {
                pinPillPosition = PIN_VISIBLE_POSITION;
              });
            },
          ),
        );
      },
    );
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "YOUR_API_KEY",
      PointLatLng(currentLocation.latitude, currentLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
    );
    if (result.status == 'OK') {
      result.points.forEach(
        (PointLatLng point) {
          polylineCoordinates.add(
            LatLng(point.latitude, point.longitude),
          );
        },
      );
      setState(
        () {
          _polylines.add(
            Polyline(
              width: 10,
              polylineId: const PolylineId('polyline'),
              color: const Color(0xff08a5cb),
              points: polylineCoordinates,
            ),
          );
        },
      );
    }
  }
}
