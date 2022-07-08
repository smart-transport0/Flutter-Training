import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Smart Transport'),
            accountEmail: Text('smarttransport@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(66, 103, 178, 1.0),
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userLarge),
            title: Text('Profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.mapLocationDot),
            title: Text('Start Journey'),
            onTap: () => null,
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userPlus),
            title: Text('Join  Journey'),
            onTap: () => null,
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.solidCommentDots),
            title: Text('Chat'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.clockRotateLeft),
            title: Text('Journey History'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleInfo),
            title: Text('About Us'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.arrowRightFromBracket),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
