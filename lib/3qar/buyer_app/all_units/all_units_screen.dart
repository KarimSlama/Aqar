// // 4. Updated All Units Screen (reuses existing cubit)
// import 'package:aqar/3qar/buyer_app/home/controller/home_cubit.dart';
// import 'package:aqar/3qar/buyer_app/home/widgets/building_card_item.dart';
// import 'package:aqar/core/constants/aqar_sizes.dart';
// import 'package:aqar/core/helpers/extensions.dart';
// import 'package:aqar/core/routing/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../core/common/widgets/loaders/properties_shimmer_loading.dart';
// import '../home/controller/home_state.dart';

// class AllUnitsScreen extends StatelessWidget {
//   const AllUnitsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // No need to create new BlocProvider since we're reusing existing cubit
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Units'),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return state.maybeWhen(
//             loading: () => const PropertiesShimmerLoading(),
//             success: (units) {
//               if (units.isEmpty) {
//                 return const Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.apartment_outlined,
//                           size: 80, color: Colors.grey),
//                       SizedBox(height: 16),
//                       Text('No units available',
//                           style: TextStyle(fontSize: 18, color: Colors.grey)),
//                     ],
//                   ),
//                 );
//               }

//               return Padding(
//                 padding: const EdgeInsetsDirectional.all(AqarSizes.ms),
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: AqarSizes.sm,
//                     mainAxisSpacing: AqarSizes.sm,
//                     childAspectRatio: 0.8,
//                   ),
//                   itemCount: units.length, // Shows ALL units
//                   itemBuilder: (context, index) {
//                     return BuildingCardItem(
//                       unit: units[index],
//                       onTap: () => context.pushNamed(Routes.allUnitsScreen),
//                     );
//                   },
//                 ),
//               );
//             },
//             error: (error) => Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.error_outline, size: 80, color: Colors.red),
//                   const SizedBox(height: 16),
//                   Text('Error: $error',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(color: Colors.red)),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () => context.read<HomeCubit>().fetchUnits(),
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             ),
//             orElse: () => const SizedBox.shrink(),
//           );
//         },
//       ),
//     );
//   }
// }
