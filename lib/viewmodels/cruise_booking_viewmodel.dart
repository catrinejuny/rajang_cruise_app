import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

// ViewModel managing booking state and business logic
class CruiseBookingViewModel extends ChangeNotifier {
  // Static destination data
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. '
        'Cruise past historic temples, timber hubs, and traditional waterfront settlements '
        'while experiencing authentic Sarawakian hospitality.',
    imageUrl:
    'https://ik.imgkit.net/3vlqs5axxjf/TW-Asia/uploadedImages/Industry/Cruise/Borneo-River-Cruise-Beneath-Sibu-City-Skyline-261028.jpg?tr=w-1200%2Cfo-auto',
    initialRating: 43,
    packages: [
      'Private River Cruise',
      'Sunset Cruise',
      'Sunrise Cruise',
      'Rural Cruise',
      'SMI Park Cruise',
    ],
  );

  // State fields
  late int _starCount;
  bool _isStarred = false;
  DateTime _selectedDate = DateTime(2026, 11, 15);
  late String _selectedPackage;
  bool _isDarkMode = false;

  CruiseBookingViewModel() {
    _starCount = destination.initialRating;
    _selectedPackage = destination.packages.first;
  }

  // Getters
  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  // Format date as DD/MM/YYYY
  String get formattedDate =>
      '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}';

  // Toggle favorite star status and update count
  void toggleStar() {
    if (_isStarred) {
      _starCount -= 1;
      _isStarred = false;
    } else {
      _starCount += 1;
      _isStarred = true;
    }
    notifyListeners();
  }

  // Update selected visit date
  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  // Update selected cruise package
  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  // Toggle between light and dark theme
  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}