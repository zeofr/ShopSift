import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.12,
                  backgroundImage: AssetImage('assets/images/drawerBackground.jpg'),
                ),
                SizedBox(width: screenWidth * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Z A I D',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text('+91 XXXXXXXXXX'),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: Theme.of(context).iconTheme.color),
              ],
            ),
            Divider(),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context,listen: false).toggleTheme();// The logic for theme switching will be handled in the theme provider
              },
              secondary: Icon(Icons.nightlight_round, color: Theme.of(context).iconTheme.color),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildSettingsOption(
              context,
              'Account Settings',
              Icons.person,
              'Privacy, Security, Language',
              () => Navigator.pushNamed(context, '/account_details'),
            ),
            _buildSettingsOption(
              context,
              'Notifications',
              Icons.notifications,
              'Newsletter, App Updates',
              () => _showDevelopmentAlert(context),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildSettingsOption(
              context,
              'Logout',
              Icons.exit_to_app,
              '',
              () => _showLogoutDialog(context),
            ),
            _buildSettingsOption(
              context,
              'Delete Account',
              Icons.delete,
              '',
              () => _showDevelopmentAlert(context),
            ),
            Divider(),
            _buildSettingsOption(
              context,
              'Report A Bug',
              Icons.bug_report,
              '',
              () => _showDevelopmentAlert(context),
            ),
            _buildSettingsOption(
              context,
              'Send Feedback',
              Icons.feedback,
              '',
              () => _showDevelopmentAlert(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context, String title, IconData icon, String subtitle, Function onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      onTap: () => onTap(),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  void _showDevelopmentAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Under Development'),
          content: Text('This section is under development and will be available soon!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('LOG OUT'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/signin');
              },
            ),
          ],
        );
      },
    );
  }
}
