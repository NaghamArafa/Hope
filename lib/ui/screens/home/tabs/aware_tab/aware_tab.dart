import 'package:flutter/material.dart';
import 'package:hope/model/category_dm.dart';

class AwareTab extends StatefulWidget {
  static const String routeName = '/awareness';

  const AwareTab({super.key});

  @override
  State<AwareTab> createState() => _AwareTabState();
}

class _AwareTabState extends State<AwareTab> {
  CategoryDM selectedCategory = CategoryDM.allCategory;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

// Expanded buildEventsListView() {
//   return Expanded(
//     child: StreamBuilder<List<EventDM>>(
//       stream: getEventsByCategory(selectedCategory.name),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           print(
//               "Error While LOADING EVENTS: ${snapshot.error}: ${snapshot.stackTrace}");
//           return const Text("Error");
//         } else if (snapshot.hasData) {
//           var eventsList = snapshot.data ?? [];
//           return eventsList.isEmpty
//               ? const Center(
//               child: Text(
//                 "Currently There is no available events",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                     color: AppColors.purple),
//               ))
//               : ListView.builder(
//             itemBuilder: (context, index) => EventWidget(
//               eventDM: eventsList[index],
//             ),
//             itemCount: eventsList.length,
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     ),
//   );
// }
}
