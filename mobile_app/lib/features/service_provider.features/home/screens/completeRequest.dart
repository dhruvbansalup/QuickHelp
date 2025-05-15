import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

class CompleteRequestPage extends StatelessWidget {
  const CompleteRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
     final isDark = QHelperFunctions.isDarkMode(context);
    final requests = [
      {
        'name': 'Vishnu Singh',
        'rating': '4.2',
        'work': 'Geyser inlet cleaning',
        'location': 'Near Dwarka sector 21',
        'time': '2.50 pm',
        'date': '01-05-2025',
      },
      {
        'name': 'Surya Kumar',
        'rating': '3.9',
        'work': 'roolerepair',
        'location': 'Near Haus Khas Village',
        'time': '9.15 am',
        'date': '12-05-2025',
      },
      {
        'name': 'Rohan paswan',
        'rating': '4.4',
        'work': 'Wiring repairr',
        'location': 'Pocket 4 , Pitampura',
        'time': '7.20 pm',
        'date': '02-05-2025',
      },
      {
        'name': 'Virat kohli',
        'rating': '4.9',
        'work': 'AC installation',
        'location': 'Pocket 4 , begumpur',
        'time': '7.20 pm',
        'date': '31-04-2025',
      },
      {
        'name': 'riyan parag',
        'rating': '4.4',
        'work': 'Oven repair',
        'location': 'Pocket 4 , Keshavpuram',
        'time': '7.20 pm',
        'date': '22-04-2025',
      },
  
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: isDark ? QAppColors.darkText : QAppColors.lightText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Completed requests'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side:  BorderSide(color: isDark ? QAppColors.darkText : QAppColors.lightText),
              ),
              icon: Icon(Icons.filter_alt_outlined, size: 20, color: isDark ? QAppColors.darkText : QAppColors.lightText),
              label: Text("Filters" , style :TextStyle(
                color: isDark ? QAppColors.darkText : QAppColors.lightText
              )),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final r = requests[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
            //  color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isDark ? QAppColors.darkText : QAppColors.lightText),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                      children: [
                         Icon(Icons.person_outline, color: isDark ? QAppColors.darkText : QAppColors.lightText, size: 20),
                        const SizedBox(width: 6),
                        Text(
                          r['name']!,
                          style: TextStyle(
                            color: isDark ? QAppColors.darkText : QAppColors.lightText,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                         Icon(Icons.star, size: 16, color: isDark ? QAppColors.darkText : QAppColors.lightText),
                        Text(
                          r['rating']!,
                          style: TextStyle(color: isDark ? QAppColors.darkText : QAppColors.lightText),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(r['work']!, style:  TextStyle(color: isDark ? QAppColors.darkText : QAppColors.lightText)),
                    Text(
                      r['location']!,
                      style:  TextStyle(color: isDark ? QAppColors.darkText : QAppColors.lightText, fontSize: 13),
                    ),
                  ],
                ),
                // Right section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(r['time']!, style:  TextStyle(color: isDark ? QAppColors.darkText : QAppColors.lightText)),
                    Text(r['date']!, style:  TextStyle(color: isDark ? QAppColors.darkText : QAppColors.lightText)),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}