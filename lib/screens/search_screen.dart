import 'package:flutter/material.dart';
import 'package:study/widgets/drawer.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:study/widgets/my_appbar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: searchAppBar(title: "Search", context: context),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SearchBar<Post>(
            onSearch: search,
            hintText: "Enter title or author",
            placeHolder: Center(child: Text("data")),
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
