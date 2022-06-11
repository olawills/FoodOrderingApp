import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:palmo/widgets/main_app_bar.dart';

import 'package:palmo/widgets/map_bottom_pill.dart';
import 'package:palmo/widgets/map_user.dart';

const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.744421, -71.1698939);
const double CAMERA_ZOOM = 8;
const double CAMERA_TILT = 40;
const double CAMERA_BEARING = 20;
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

  @override
  void initState() {
    super.initState();

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
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onTap: (LatLng loc) {
                // tapping on the map will dismiss the bottom pill
                pinPillPosition = PIN_INVISIBLE_POSITION;
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);

                showPinsOnMap();
              },
            ),
          ),
          const Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: MapUser(),
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
        _markers.add(Marker(
          markerId: const MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
        ));

        _markers.add(Marker(
            markerId: const MarkerId('destinationPin'),
            position: destinationLocation,
            icon: destinationIcon,
            onTap: () {
              setState(() {
                pinPillPosition = PIN_VISIBLE_POSITION;
              });
            }));
      },
    );
  }
}
