import 'package:crash/utils/utils.dart';
import 'package:crash/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 80),
            RoundButton(
              title: 'Post',
              onTap: () {
                if (postController.text.isEmpty) {
                  Utils().toastMessage('Post content cannot be empty');
                  return;
                }

                setState(() {
                  loading = true;
                });

                String id = DateTime.now().millisecondsSinceEpoch.toString();
                databaseRef.child(id).set({
                  'title': postController.text.toString(),
                  'id': id,
                }).then((value) {
                  Utils().toastMessage('Post added');
                  setState(() {
                    loading = false;
                  });
                  postController.clear();
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
              },
            ),
            if (loading)
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
