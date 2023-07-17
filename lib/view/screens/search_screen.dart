import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/search_user_controller.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchQuery = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: searchQuery,
         
          decoration: InputDecoration(
            hintText: 'Search username',
            icon: Icon(
              Icons.search_rounded,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('This will be the Search Page'),
      ),
    );
  }
}
