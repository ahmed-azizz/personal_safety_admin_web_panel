import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ImagePickerWidget.dart';

class NewsAddScreen extends StatefulWidget {
  const NewsAddScreen({Key? key}) : super(key: key);

  @override
  State<NewsAddScreen> createState() => _NewsAddScreenState();
}

class _NewsAddScreenState extends State<NewsAddScreen> {

  final Atitle = TextEditingController();
  final Acontent = TextEditingController();
  final AimageUrl = TextEditingController();
  final Apublish_date=TextEditingController();



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
              controller: Atitle,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: Acontent,
              decoration: const InputDecoration(hintText: 'Content'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),



            child: TextField(
              controller: AimageUrl,
              decoration: const InputDecoration(hintText: 'Image'),
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(MediaQuery.of(context).size.width - 200, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.add),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('announcement')
                    .add({
                  'Atitle': Atitle.text,
                  'Acontent': Acontent.text,
                  'AimageUrl': AimageUrl.text,
                  'Apublish_date': DateTime.now().toString(),
                });
                print(FirebaseFirestore.instance.collection('users').id.toString());
              },
              label: const Text('Add announcement')),


          ///////////////////////////////////////
          SizedBox(height: 45,),
          //////////////////////////////////////////////


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
                backgroundColor: Colors.purple,
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
                  'publish_date': DateTime.now().toIso8601String(),
                });
                print(FirebaseFirestore.instance.collection('users').id.toString());
              },
              label: const Text('Add news')),


        ],
      ),
    );
  }
}