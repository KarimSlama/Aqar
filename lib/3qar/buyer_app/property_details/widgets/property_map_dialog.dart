import 'dart:ui';
import 'package:aqar/3qar/buyer_app/property_details/widgets/property_images_bottom_sheet.dart';
import 'package:aqar/3qar/buyer_app/property_details/widgets/toggle_map_theme_icon.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../3qar/buyer_app/home/data/model/property_image_model.dart';

class PropertyMapDialog extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String? propertyName;
  final List<PropertyImageModel>? propertyImages;

  const PropertyMapDialog({
    super.key,
    required this.latitude,
    required this.longitude,
    this.propertyName,
    this.propertyImages,
  });

  @override
  State<PropertyMapDialog> createState() => _PropertyMapDialogState();
}

class _PropertyMapDialogState extends State<PropertyMapDialog> {
  GoogleMapController? mapController;
  late Set<Marker> markers;
  bool _isMapReady = false;

  @override
  void initState() {
    super.initState();
    markers = {
      Marker(
        markerId: const MarkerId('property_location'),
        position: LatLng(widget.latitude, widget.longitude),
        infoWindow: InfoWindow(
          title: widget.propertyName ?? 'property_location',
          snippet: widget.propertyImages?.isNotEmpty == true
              ? 'Tap to Display Images'
              : 'No Images found',
        ),
        onTap: () {
          if (widget.propertyImages?.isNotEmpty == true) {
            _showPropertyImages();
          }
        },
      ),
    };
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isMapReady = true;
        });
      }
    });
  }

  void _showPropertyImages() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => PropertyImagesBottomSheet(
        images: widget.propertyImages!,
        propertyName: widget.propertyName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    spacing: 7.w,
                    children: [
                      const Icon(
                        Iconsax.location,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.propertyName ?? 'Property Name',
                                style: theme.textTheme.headlineSmall!
                                    .apply(color: AqarColors.white)),
                            if (widget.propertyImages?.isNotEmpty == true)
                              Text(
                                '${widget.propertyImages!.length} Images',
                                style: theme.textTheme.bodyMedium!
                                    .apply(color: AqarColors.white),
                              ),
                          ],
                        ),
                      ),
                      if (widget.propertyImages?.isNotEmpty == true)
                        IconButton(
                          onPressed: _showPropertyImages,
                          icon: const Icon(
                            Iconsax.gallery,
                            color: Colors.white,
                          ),
                        ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Iconsax.close_circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Map
                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(widget.latitude, widget.longitude),
                          zoom: 15,
                        ),
                        markers: markers,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        zoomControlsEnabled: true,
                        mapType: MapType.normal,
                      ),
                      AnimatedOpacity(
                        opacity: _isMapReady ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: _isMapReady && mapController != null
                            ? ToggleMapThemeIcon(mapController: mapController!)
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }
}
