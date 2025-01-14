import 'package:flutter/material.dart';
import 'package:unit_app_flutter/pages/api_data_page.dart';
import 'conversion_page.dart';
import 'settings_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      backgroundColor: Colors.blue, // Light blue color for the background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check if the screen is in landscape orientation
            bool isLandscape = constraints.maxWidth > constraints.maxHeight;

            return SingleChildScrollView( // Make the entire page scrollable
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryTile(
                    category: 'Length',
                    imagePath: 'assets/images/ruler.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConversionPage(category: 'Length')),
                    ),
                    isLandscape: isLandscape,
                  ),
                  CategoryTile(
                    category: 'Temperature',
                    imagePath: 'assets/images/fire.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConversionPage(category: 'Temperature')),
                    ),
                    isLandscape: isLandscape,
                  ),
                  CategoryTile(
                    category: 'Mass',
                    imagePath: 'assets/images/scale.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConversionPage(category: 'Mass')),
                    ),
                    isLandscape: isLandscape,
                  ),
                  // Add the Settings category
                  CategoryTile(
                    category: 'Settings',
                    imagePath: 'assets/images/settings.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    ),
                    isLandscape: isLandscape,
                  ),
                  CategoryTile(
                    category: 'API Data',
                    imagePath: 'assets/images/api_icon.png',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ApiDataPage()),
                    ),
                    isLandscape: isLandscape,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String category;
  final String imagePath;
  final VoidCallback onTap;
  final bool isLandscape;

  const CategoryTile({
    required this.category,
    required this.imagePath,
    required this.onTap,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(imagePath, width: isLandscape ? 80 : 50, height: isLandscape ? 80 : 50, fit: BoxFit.cover),
        title: Text(
          category,
          style: TextStyle(fontSize: isLandscape ? 22 : 20),
        ),
        onTap: onTap,
      ),
    );
  }
}
