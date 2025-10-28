import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../controller/search/bloc/search_bloc.dart';
import '../controller/search/bloc/search_event.dart';

class FilterMenuItems extends StatefulWidget {
  const FilterMenuItems({super.key});

  @override
  State<FilterMenuItems> createState() => _FilterMenuItemsState();
}

class _FilterMenuItemsState extends State<FilterMenuItems> {
  String selectedValue = "Select";

  final Map<int, String> filterOptions = {
    0: "Price",
    1: "Location",
    2: "Area",
    3: "Rooms",
    4: "Type",
  };

  void _handleFilterSelection(BuildContext context, int value) {
    final searchBloc = context.read<SearchBloc>();

    switch (value) {
      case 0: // Price
        _showPriceFilter(context, searchBloc);
        break;
      case 1: // Location
        _showLocationFilter(context, searchBloc);
        break;
      case 2: // Area
        _showAreaFilter(context, searchBloc);
        break;
      case 3: // Rooms
        _showRoomsFilter(context, searchBloc);
        break;
      case 4: // Type (Sale/Rent)
        _showTypeFilter(context, searchBloc);
        break;
    }

    setState(() {
      selectedValue = filterOptions[value] ?? "Select";
    });
  }

  void _showPriceFilter(BuildContext context, SearchBloc searchBloc) {
    showDialog(
      context: context,
      builder: (context) => PriceFilterDialog(
        onApply: (minPrice, maxPrice) {
          searchBloc.add(SearchQueryChanged(
            minPrice: minPrice,
            maxPrice: maxPrice,
          ));
        },
      ),
    );
  }

  void _showLocationFilter(BuildContext context, SearchBloc searchBloc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LocationFilterBottomSheet(
        onApply: (location) {
          searchBloc.add(SearchQueryChanged(location: location));
        },
      ),
    );
  }

  void _showAreaFilter(BuildContext context, SearchBloc searchBloc) {
    showDialog(
      context: context,
      builder: (context) => AreaFilterDialog(
        onApply: (minArea, maxArea) {
          searchBloc.add(SearchQueryChanged(
            minArea: minArea,
            maxArea: maxArea,
          ));
        },
      ),
    );
  }

  void _showRoomsFilter(BuildContext context, SearchBloc searchBloc) {
    showDialog(
      context: context,
      builder: (context) => RoomsFilterDialog(
        onApply: (rooms, bathrooms) {
          searchBloc.add(SearchQueryChanged(
            numberOfRooms: rooms,
            numberOfBathrooms: bathrooms,
          ));
        },
      ),
    );
  }

  void _showTypeFilter(BuildContext context, SearchBloc searchBloc) {
    showDialog(
      context: context,
      builder: (context) => TypeFilterDialog(
        onApply: (saleType) {
          searchBloc.add(SearchQueryChanged(saleType: saleType));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Row(
        spacing: AqarSizes.sm,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(selectedValue,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: AqarColors.light)),
          Icon(Iconsax.arrow_down_1_copy, color: AqarColors.light),
        ],
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(Iconsax.dollar_circle, size: 20),
              SizedBox(width: 8),
              Text("Price"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Iconsax.location, size: 20),
              SizedBox(width: 8),
              Text("Location"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Iconsax.size, size: 20),
              SizedBox(width: 8),
              Text("Area"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Icon(Iconsax.home, size: 20),
              SizedBox(width: 8),
              Text("Rooms"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Row(
            children: [
              Icon(Iconsax.tag, size: 20),
              SizedBox(width: 8),
              Text("Type"),
            ],
          ),
        ),
      ],
      onSelected: (value) => _handleFilterSelection(context, value),
    );
  }
}

// 1. Price Filter Dialog
class PriceFilterDialog extends StatefulWidget {
  final Function(double?, double?) onApply;

  const PriceFilterDialog({super.key, required this.onApply});

  @override
  State<PriceFilterDialog> createState() => _PriceFilterDialogState();
}

class _PriceFilterDialogState extends State<PriceFilterDialog> {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Iconsax.dollar_circle, color: AqarColors.primary),
          SizedBox(width: 8),
          Text('Filter by Price'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: minPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Min Price',
              prefixIcon: Icon(Iconsax.money),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: maxPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Max Price',
              prefixIcon: Icon(Iconsax.money),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final minPrice = double.tryParse(minPriceController.text);
            final maxPrice = double.tryParse(maxPriceController.text);
            widget.onApply(minPrice, maxPrice);
            Navigator.pop(context);
          },
          child: Text('Apply'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }
}

// 2. Location Filter Bottom Sheet
class LocationFilterBottomSheet extends StatefulWidget {
  final Function(String) onApply;

  const LocationFilterBottomSheet({super.key, required this.onApply});

  @override
  State<LocationFilterBottomSheet> createState() =>
      _LocationFilterBottomSheetState();
}

class _LocationFilterBottomSheetState extends State<LocationFilterBottomSheet> {
  final List<String> popularLocations = [
    'القاهرة',
    'الجيزة',
    'الإسكندرية',
    'مدينة نصر',
    'المهندسين',
    'التجمع الخامس',
    '6 أكتوبر',
    'الشيخ زايد',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Iconsax.location, color: AqarColors.primary),
                SizedBox(width: 8),
                Text(
                  'Select Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),
          // Locations List
          Expanded(
            child: ListView.builder(
              itemCount: popularLocations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Iconsax.location),
                  title: Text(popularLocations[index]),
                  onTap: () {
                    widget.onApply(popularLocations[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Area Filter Dialog
class AreaFilterDialog extends StatefulWidget {
  final Function(int?, int?) onApply;

  const AreaFilterDialog({super.key, required this.onApply});

  @override
  State<AreaFilterDialog> createState() => _AreaFilterDialogState();
}

class _AreaFilterDialogState extends State<AreaFilterDialog> {
  final TextEditingController minAreaController = TextEditingController();
  final TextEditingController maxAreaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Iconsax.size, color: AqarColors.primary),
          SizedBox(width: 8),
          Text('Filter by Area'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: minAreaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Min Area (m²)',
              prefixIcon: Icon(Iconsax.size),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: maxAreaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Max Area (m²)',
              prefixIcon: Icon(Iconsax.size),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final minArea = int.tryParse(minAreaController.text);
            final maxArea = int.tryParse(maxAreaController.text);
            widget.onApply(minArea, maxArea);
            Navigator.pop(context);
          },
          child: Text('Apply'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    minAreaController.dispose();
    maxAreaController.dispose();
    super.dispose();
  }
}

// 4. Rooms Filter Dialog
class RoomsFilterDialog extends StatefulWidget {
  final Function(int?, int?) onApply;

  const RoomsFilterDialog({super.key, required this.onApply});

  @override
  State<RoomsFilterDialog> createState() => _RoomsFilterDialogState();
}

class _RoomsFilterDialogState extends State<RoomsFilterDialog> {
  int? selectedRooms;
  int? selectedBathrooms;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Iconsax.home, color: AqarColors.primary),
          SizedBox(width: 8),
          Text('Filter by Rooms'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bedrooms
          Text('Number of Bedrooms',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: List.generate(6, (index) {
              final number = index + 1;
              return ChoiceChip(
                label: Text('$number'),
                selected: selectedRooms == number,
                onSelected: (selected) {
                  setState(() {
                    selectedRooms = selected ? number : null;
                  });
                },
              );
            }),
          ),
          SizedBox(height: 16),
          // Bathrooms
          Text('Number of Bathrooms',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: List.generate(5, (index) {
              final number = index + 1;
              return ChoiceChip(
                label: Text('$number'),
                selected: selectedBathrooms == number,
                onSelected: (selected) {
                  setState(() {
                    selectedBathrooms = selected ? number : null;
                  });
                },
              );
            }),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onApply(selectedRooms, selectedBathrooms);
            Navigator.pop(context);
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}

// 5. Type Filter Dialog (Sale/Rent)
class TypeFilterDialog extends StatefulWidget {
  final Function(String) onApply;

  const TypeFilterDialog({super.key, required this.onApply});

  @override
  State<TypeFilterDialog> createState() => _TypeFilterDialogState();
}

class _TypeFilterDialogState extends State<TypeFilterDialog> {
  String? selectedType;

  final List<String> types = ['For Sale', 'For Rent'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Iconsax.tag, color: AqarColors.primary),
          SizedBox(width: 8),
          Text('Filter by Type'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: types.map((type) {
          return RadioListTile<String>(
            title: Text(type),
            value: type,
            groupValue: selectedType,
            onChanged: (value) {
              setState(() {
                selectedType = value;
              });
            },
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedType != null) {
              widget.onApply(selectedType ?? '');
              Navigator.pop(context);
            }
            Navigator.pop(context);
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}
