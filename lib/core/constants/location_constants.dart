import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationConstants {
  static Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location services are disabled. Please enable them.'),
      ));
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permissions are denied'),
        ));
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are permanently denied'),
      ));
      return false;
    }

    return true;
  }

  static Future<void> openMap(context, latitude, longitude) async {
    if (latitude == null || longitude == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('الموقع غير متوفر لهذا العقار'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      return;
    }

    debugPrint('Opening map for: lat=$latitude, lng=$longitude');

    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final String geoUrl = 'geo:$latitude,$longitude?q=$latitude,$longitude';
    
    try {
      final Uri geoUri = Uri.parse(geoUrl);
      if (await canLaunchUrl(geoUri)) {
        debugPrint('Launching with geo URI');
        await launchUrl(geoUri, mode: LaunchMode.externalApplication);
        return;
      }

      final Uri googleUri = Uri.parse(googleMapsUrl);
      if (await canLaunchUrl(googleUri)) {
        debugPrint('Launching with Google Maps URL');
        await launchUrl(googleUri, mode: LaunchMode.externalApplication);
        return;
      }

      throw 'لا يمكن فتح الخريطة';
      
    } catch (e) {
      debugPrint('Error opening map: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ أثناء فتح الخريطة: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

}
