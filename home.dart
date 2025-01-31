import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users =  [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text('Information'),),
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context,index){
          var user = users[index];
          final email = user['email'];
        return ListTile(
        title: Text(email),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }


  void fetchUsers() async {
    print("fetchUsers called");
    const url = 'https://newsapi.org/v2/everything?q=tesla&from=2024-12-27&sortBy=publishedAt&apiKey=3e0e11c8734549b9b2ffd86ff48fc9ee ';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print ('fetchUsers completed');
  }
}