import 'package:flutter/material.dart';
import 'package:quick_help/features/service_provider.features/service_listing/screens/ExplainNewServicePage.dart';

class NewServiceSelectionPage extends StatefulWidget {
  const NewServiceSelectionPage({super.key});

  @override
  State<NewServiceSelectionPage> createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<NewServiceSelectionPage> {
  final List<String> serviceTypes = [
    'Electrician',
    'Plumber',
    'Chef',
    'Car washer',
    'Laundry',
    'Painter',
    'Carpenter',
    'Household cleaner',
    'AC service & repair',
    'Cooler & fan repair',
    'Electronic repair',
    'TV & display service',
    'Fridge service',
    'Other',
  ];

  String? selectedService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My services')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your service type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              hint: const Text("Select a service"),
              value: selectedService,
              items: serviceTypes.map((String service) {
                return DropdownMenuItem<String>(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedService = newValue;
                });
              },
            ),
            const SizedBox(height: 24),
            if (selectedService == 'Other')
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Please specify your service',
                  border: OutlineInputBorder(),
                ),
              ),
             const SizedBox(height: 24),
             TextField(
                decoration: const InputDecoration(
                  labelText: 'give name to your service',
                  border: OutlineInputBorder(),
                ),
              ),
               const SizedBox(height: 24),
               TextField(
                decoration: const InputDecoration(
                  labelText: 'Experience in year',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
            ElevatedButton(
              onPressed: selectedService != null ? () {
                 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExplainNewServicePage()),
                          );
                        
              } : null,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}