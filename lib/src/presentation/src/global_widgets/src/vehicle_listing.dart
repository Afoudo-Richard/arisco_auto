// import 'package:arisco_auto/arisco_auto.dart';
// import 'package:flutter/material.dart';

// class VehicleListing extends StatefulWidget {
//   const VehicleListing(
//       {super.key,
//       this.isScrollable = false,
//       this.minItems = 8,
//       required this.vehicles,
//       this.onScroll,
//       required this.hasReachedMax,
//       this.loadMoreScrollExtend = 0.8,
//       this.paddinng,
//       this.showVehicleItemActivationStatusBar = false});

//   final bool isScrollable;
//   final int minItems;
//   final List<Vehicle> vehicles;
//   final void Function()? onScroll;
//   final bool hasReachedMax;
//   final double loadMoreScrollExtend;
//   final EdgeInsets? paddinng;
//   final bool showVehicleItemActivationStatusBar;

//   @override
//   State<VehicleListing> createState() => _VehicleListingState();
// }

// class _VehicleListingState extends State<VehicleListing> {
//   final _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.vehicles.isEmpty
//         ? const Center(
//             child: FetchEmpty(
//               message: "No vehicle found",
//             ),
//           )
//         : ListView.separated(
//             padding: widget.paddinng,
//             itemBuilder: (context, index) {
//               final vehicleItem = VehicleItem(
//                 showActivationStatusBar:
//                     widget.showVehicleItemActivationStatusBar,
//                 vehicle: widget.vehicles[index],
//               );
//               return widget.isScrollable
//                   ? (index >= widget.vehicles.length
//                       ? LoadingIndicator()
//                       : vehicleItem)
//                   : vehicleItem;
//             },
//             controller: widget.isScrollable ? _scrollController : null,
//             separatorBuilder: (context, index) {
//               final divider = Divider(
//                 height: 2.h,
//               );

//               return divider;
//             },
//             itemCount: widget.isScrollable
//                 ? (widget.hasReachedMax
//                     ? widget.vehicles.length
//                     : widget.vehicles.length + 1)
//                 : (widget.vehicles.length >= widget.minItems
//                     ? widget.minItems
//                     : widget.vehicles.length),
//             physics: widget.isScrollable
//                 ? null
//                 : const NeverScrollableScrollPhysics(),
//             shrinkWrap: widget.isScrollable == false ? true : false,
//           );
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_isBottom) {
//       if (widget.onScroll != null) {
//         widget.onScroll!();
//       }
//     }
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * widget.loadMoreScrollExtend);
//   }
// }
