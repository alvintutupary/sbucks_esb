import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/personal_screen/personal_screen.dart';
import 'package:sbucks/src/screens/reward_screen/reward_screen.dart';
import 'package:sbucks/src/screens/setting_screen/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Column(
          children: [
            _buildMenuProfile(
                'Card Transaction History', Icons.file_copy_outlined, () {}),
            _buildMenuProfile('Rewards', Icons.person, () {
              Navigator.pushNamed(context, RewardScreen.kRouteName);
            }),
            _buildMenuProfile('Personal', Icons.card_giftcard, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PersonalScreen()));
            }),
            _buildMenuProfile('Settings', Icons.settings, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingScreen()));
            }),
          ],
        ));
  }

  _buildMenuProfile(String title, IconData icon, Function onTap) {
    return Column(
      children: [
        Column(
          children: [
            InkWell(
              child: ListTile(
                title: Text(title),
                trailing: Icon(icon),
                onTap: onTap,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}
