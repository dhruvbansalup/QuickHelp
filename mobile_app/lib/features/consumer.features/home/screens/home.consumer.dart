import 'package:flutter/material.dart';
import 'package:quick_help/common/styles/spacing_styles.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

// Sample data

final List<Map<String, String>> serviceIcons = [
  {'icon': 'assets/images/electrician.png', 'label': 'Electrician'},
  {'icon': 'assets/images/plumber.png', 'label': 'Plumber'},
  {'icon': 'assets/images/Chef.png', 'label': 'Cook'},
  {'icon': 'assets/images/ac_repair.png', 'label': 'AC repair'},
  {'icon': 'assets/images/Pet.png', 'label': 'Pet care'},
  {'icon': 'assets/images/Janitor.png', 'label': 'Cleaning'},
  {'icon': 'assets/images/Baby_sitter.png', 'label': 'Babysitter service'},
  {'icon': 'assets/images/car_wash.png', 'label': 'Car wash at home'},
  {'icon': 'assets/images/Wash.png', 'label': 'Cloth washer'},
];

final List<Map<String, String>> mostBooked = [
  {
    'title': 'Deep clean with foam-jet AC service',
    'subtitle': 'AC service & repair',
    'image': 'assets/images/ac man.jpg',
  },
  {
    'title': 'MCB repair',
    'subtitle': 'Electrician service',
    'image': 'assets/images/electrician.jpg',
  },
  {
    'title': 'Need a dog walker ?',
    'subtitle': 'By certified walkers',
    'image': 'assets/images/dog walk.jpg',
  },
];

final List<Map<String, String>> applianceServices = [
  {
    'label': 'AC repair & installation',
    'image': 'assets/images/ac.png',
  },
  {
    'label': 'Geyser repair',
    'image': 'assets/images/geyser.png',
  },
  {
    'label': 'Cooler repair',
    'image': 'assets/images/cooler.png',
  },
  {
    'label': 'Washing machine repair',
    'image': 'assets/images/washing_machine.png',
  },
];

class ConsumerHome extends StatelessWidget {
  const ConsumerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: QSpacingStyles.paddingWithAppBar,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
            Icon(Icons.location_on, color: isDark ? QAppColors.darkText : QAppColors.lightText, size: 30),
              const SizedBox(width: 8),
               Expanded(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                    Text(
                       'Service Location',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isDark ? QAppColors.darkText : QAppColors.lightText,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Pocket 11 sector 22, Rohini',
                  style: TextStyle(
                    fontSize: 14,
                   
                    // ignore: deprecated_member_use
                    color: isDark ? QAppColors.darkText.withOpacity(0.7) : QAppColors.lightText.withOpacity(0.7),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
               const SizedBox(width: 4),
              Icon(Icons.arrow_drop_down, color: isDark ? QAppColors.darkText : QAppColors.lightText),
            ],
          ),
        ],
      ),
    ),
  ],
),
            
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for services',
                    prefixIcon: Icon(Icons.search,
                    color: isDark ? QAppColors.darkText : QAppColors.lightText),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: isDark ? QAppColors.darkText : QAppColors.lightText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Services Grid
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [
                    for (final service in serviceIcons)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(service['icon']!, height: 90),
                          const SizedBox(height: 6),
                          Text(service['label']!, textAlign: TextAlign.center),
                        ],
                      ),
                  ],
                ),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 97, 109),
                     // backgroundColor: Colors.teal.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Available services nearby you',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Most Booked Services
                Text(
                  'Most booked services',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                  color: isDark ? QAppColors.darkText : QAppColors.lightText),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mostBooked.length,
                    itemBuilder: (context, index) {
                      final item = mostBooked[index];
                      return Container(
                        width: 400,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey.shade800 : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            // Left Column with text and button
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isDark ? QAppColors.darkText : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item['subtitle']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isDark ? QAppColors.darkText.withOpacity(0.7) : Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    child:  Text(
                                      'Book now',
                                      style: TextStyle(fontSize: 18, color:Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            // Right Side Image
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item['image']!,
                                  fit: BoxFit.cover,
                                  height: 150,
                          
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Appliance Service & Repair
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Appliance service & repair',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                          color: isDark ? QAppColors.darkText : QAppColors.lightText),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(color: isDark ? QAppColors.darkText : QAppColors.lightText),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: applianceServices.length,
                    itemBuilder: (context, index) {
                      final item = applianceServices[index];
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.white, Color(0xFF006D69)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(item['image']!),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item['label']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12,color:Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}