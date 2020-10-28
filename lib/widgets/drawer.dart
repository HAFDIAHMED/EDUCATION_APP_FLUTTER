import 'package:flutter/material.dart';
import 'package:study/constants.dart';
import 'package:study/main.dart';
import 'package:study/screens/book_list_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Welcome to Solutions",
              style:
                  Theme.of(context).textTheme.title.copyWith(color: kWhitColor),
            ),
            accountEmail: Text("Full Details Solutions"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: kWhitColor,
              child: Icon(
                Icons.blur_linear,
                size: 40,
                color: kPrimaryColor,
              ),
            ),
          ),
          MenuItem(
            title: "Home",
            iconName: Icons.home,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          MenuItem(
              title: "All Books",
              iconName: Icons.library_books,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookListhScreen(),
                  ),
                );
              }),
          MenuItem(
              title: "Request",
              iconName: Icons.record_voice_over,
              press: () {}),
          MenuItem(title: "About US", iconName: Icons.info, press: () {}),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {@required this.title, @required this.iconName, @required this.press});

  final String title;
  final IconData iconName;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline.copyWith(fontSize: 20),
      ),
      leading: Icon(
        iconName,
        color: kBlackLightColor,
      ),
    );
  }
}
