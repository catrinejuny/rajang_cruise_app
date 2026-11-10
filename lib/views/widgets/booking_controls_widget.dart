import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

// Stateful widget containing interactive controls for booking preferences
class BookingControlsWidget extends StatefulWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({
    super.key,
    required this.viewModel,
  });

  @override
  State<BookingControlsWidget> createState() => _BookingControlsWidgetState();
}

class _BookingControlsWidgetState extends State<BookingControlsWidget> {
  // Opens date picker dialog and updates ViewModel
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.viewModel.selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      widget.viewModel.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trip Preferences',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(height: 24),

            // Visit date picker tile
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: const Text('Cruise Date'),
              trailing: TextButton(
                onPressed: () => _pickDate(context),
                child: Text(
                  vm.formattedDate,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () => _pickDate(context),
            ),

            // Cruise package dropdown selector
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.directions_boat_filled),
              title: const Text('Cruise Package'),
              trailing: DropdownButton<String>(
                value: vm.selectedPackage,
                underline: const SizedBox(),
                items: vm.destination.packages.map((String packageName) {
                  return DropdownMenuItem<String>(
                    value: packageName,
                    child: Text(packageName),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  vm.updatePackage(newValue);
                },
              ),
            ),

            // Dark mode theme switch
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Icon(
                vm.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              title: const Text('Dark Mode Theme'),
              value: vm.isDarkMode,
              onChanged: (bool value) {
                vm.toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}