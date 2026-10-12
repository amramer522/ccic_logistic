import 'dart:async';

import 'package:ccic_g1_2026_flutter/core/logic/helper_methods.dart';
import 'package:ccic_g1_2026_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Play2View extends StatefulWidget {
  const Play2View({super.key});

  @override
  State<Play2View> createState() => _Play2StateView();
}

class _Play2StateView extends State<Play2View> {

  String? address;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('amr hello');
      Geolocator.getServiceStatusStream().listen((event) {
        print('amr getServiceStatusStream listen');

        if (event == ServiceStatus.enabled) {
          print('amr getServiceStatusStream $event');
          goToMyLocation();
        }
        print('amr: $event');
      });
      showMsg('Location services are disabled.');

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showMsg('Location permissions are denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showMsg(
        'Location permissions are permanently denied, we cannot request permissions.',
      );

      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  final _controller = Completer<GoogleMapController>();
  final geocoding = Geocoding();

  void goToMyLocation() async {
    final myPosition = await _determinePosition();
    // print here desc of this position
    final placemarks = await geocoding.placemarkFromCoordinates(myPosition.latitude, myPosition.longitude);


    address = placemarks.first.street??"";
    setState(() {

    });
    final controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(myPosition.latitude, myPosition.longitude),
          zoom: 14,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    goToMyLocation();
  }

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(address??"",style: TextStyle(fontSize: 14),),),
      body: SafeArea(
        child: GoogleMap(
          compassEnabled: true,
          markers: markers,
          onTap: (argument) {
            print('amr ${markers.length}');
            markers.add(Marker(markerId: MarkerId('pick'),position: argument));
            print('amr ${argument.latitude} ${argument.longitude}');
            print('amr ${markers.length}');
            setState(() {

            });
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onMapCreated: (controller) {
            print('amr Map created');
            _controller.complete(controller);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(31.0305132, 31.3427256),
            zoom: 14,
          ),
        ),
      ),
    );
  }
}
