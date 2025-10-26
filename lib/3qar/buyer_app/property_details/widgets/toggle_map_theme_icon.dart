import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_colors.dart';

class ToggleMapThemeIcon extends StatefulWidget {
  final GoogleMapController mapController;
  const ToggleMapThemeIcon({super.key, required this.mapController});

  @override
  State<ToggleMapThemeIcon> createState() => ToggleeMapThemeState();
}

class ToggleeMapThemeState extends State<ToggleMapThemeIcon> {
  bool _isDarkMode = false;
  static const String _darkMapStyle = '''
  [
    {
      "elementType": "geometry",
      "stylers": [{"color": "#212121"}]
    },
    {
      "elementType": "labels.icon",
      "stylers": [{"visibility": "off"}]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [{"color": "#757575"}]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [{"color": "#212121"}]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry",
      "stylers": [{"color": "#757575"}]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [{"color": "#757575"}]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [{"color": "#181818"}]
    },
    {
      "featureType": "road",
      "elementType": "geometry.fill",
      "stylers": [{"color": "#2c2c2c"}]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [{"color": "#8a8a8a"}]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [{"color": "#000000"}]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [{"color": "#3d3d3d"}]
    }
  ]
  ''';

  void _toggleMapTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    if (_isDarkMode) {
      widget.mapController.setMapStyle(_darkMapStyle);
    } else {
      widget.mapController.setMapStyle(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 4,
        child: InkWell(
          onTap: _toggleMapTheme,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: RotationTransition(
                    turns: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.elasticOut,
                      ),
                    ),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                );
              },
              child: Icon(
                _isDarkMode ? Iconsax.sun_1 : Iconsax.moon,
                key: ValueKey(_isDarkMode),
                color: _isDarkMode ? AqarColors.amber : AqarColors.primary,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
