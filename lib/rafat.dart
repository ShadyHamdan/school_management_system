// // ad_state.dart
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AdSection extends StatelessWidget {
//   const AdSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AdCubit, AdState>(
//       builder: (context, state) {
//         if (state.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state.error != null) {
//           return Center(
//             child: Text(state.error!, style: TextStyle(color: Colors.red)),
//           );
//         } else {
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: state.ads.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 margin: EdgeInsets.all(8),
//                 child: ListTile(
//                   leading: Icon(Icons.campaign, color: Colors.blue),
//                   title: Text(state.ads[index]),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
// //////////////////////////////////////////////////////////////////
