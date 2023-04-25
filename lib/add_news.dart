import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsAddScreen extends StatefulWidget {
  const NewsAddScreen({Key? key}) : super(key: key);

  @override
  State<NewsAddScreen> createState() => _NewsAddScreenState();
}

class _NewsAddScreenState extends State<NewsAddScreen> {
  final title = TextEditingController();
  final content = TextEditingController();
  final imageUrl = TextEditingController();
  final publish_date=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: title,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: content,
              decoration: const InputDecoration(hintText: 'Content'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: imageUrl,
              decoration: const InputDecoration(hintText: 'Image'),
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDD88CF),
                minimumSize: Size(MediaQuery.of(context).size.width - 200, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.add),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('news')
                    .add({
                  'name': title.text,
                  'content': content.text,
                  'imageUrl': imageUrl.text,
                  'publish_date': publish_date.toString(),
                });
                print(FirebaseFirestore.instance.collection('users').id.toString());
              },
              label: const Text('Add news'))
        ],
      ),
    );
  }
}