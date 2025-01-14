import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  bool _enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLandscape = constraints.maxWidth > constraints.maxHeight;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(fontSize: isLandscape ? 26 : 22),
                ),
                SizedBox(height: 20),
                SwitchListTile(
                  title: Text("Enable Dark Mode"),
                  value: _isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Enable Notifications"),
                  value: _enableNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      _enableNotifications = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save settings or perform any action
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Settings saved!')));
                  },
                  child: Text('Save Settings'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
