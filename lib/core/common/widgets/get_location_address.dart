import 'package:aqar/core/common/widgets/loaders/aqar_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../constants/location_constants.dart';
import 'row/title_with_icon_in_row.dart';

class GetLocationAddress extends StatefulWidget {
  final bool isHeading;
  final IconData? icon;
  const GetLocationAddress({super.key, this.isHeading = false, this.icon});

  @override
  State<GetLocationAddress> createState() => Get_LocationStateAddress();
}

class Get_LocationStateAddress extends State<GetLocationAddress> {
  Position? _currentPosition;
  String? _currentAddress;
  bool _isLoading = true;

  Future<void> _getCurrentPosition(BuildContext context) async {
    final hasPermission =
        await LocationConstants.handleLocationPermission(context);
    if (!hasPermission) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      if (!mounted) return;
      setState(() => _currentPosition = position);
      await _getAddressFromLatLng(position);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.latitude,
      );

      if (!mounted) return;
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        setState(() {
          _currentAddress = "${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      debugPrint('Error in reverse geocoding: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const AqarShimmerEffect(height: 20, width: 100);
    } else {
      return TitleWithIconInRow(
        isHeading: widget.isHeading,
        text: '$_currentAddress',
        icon: widget.icon ?? Iconsax.location,
      );
    }
  }
}
