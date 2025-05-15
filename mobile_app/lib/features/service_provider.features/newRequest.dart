import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
     final isDark = QHelperFunctions.isDarkMode(context);
    final requests = [
      {
        'name': 'Bhola Singh',
        'rating': '4.9',
        'work': 'Geyser servicing',
        'location': 'Near Dwarka vegas mall',
        'time': '2.50 pm',
        'date': '12-05-2025',
      },
      {
        'name': 'Preetam Kumar',
        'rating': '4.7',
        'work': 'Wiring external new',
        'location': 'Near Haus Khas Village',
        'time': '9.15 am',
        'date': '12-05-2025',
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
        title: const Text('New requests'),
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
              //color: Colors.black,
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