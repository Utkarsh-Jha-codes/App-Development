import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  List < Map < String, String >> articles = [];
  @override
  void initState() {
    super.initState();
    apicall();
  }
  Future<void> apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2025-01-05&sortBy=publishedAt&apiKey=3e0e11c8734549b9b2ffd86ff48fc9ee"));
    if (response.statusCode == 200) {
      setState(() {
        var jsonResponse = jsonDecode(response.body);
        var articlesList = jsonResponse["articles"];
        articles = articlesList.map<Map<String, String>> ((articles) => {
          'title': articles['title'].toString(),
          'description': articles['description'].toString()
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text('Information'),),
      ),
      body: Center(
        child: ListView.builder(
    itemCount: articles.length,
    itemBuilder: (context, index) {
      return Card (
        margin: EdgeInsets.all(10),
    child: ListTile(
    title: Text(
    articles[index]['title'] ?? 'No Tittle',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
    articles[index]['description'] ?? 'No Description',
    textAlign: TextAlign.justify,
    ),
    ),
      );
    },
    ),
    ),
    );
  }
}
