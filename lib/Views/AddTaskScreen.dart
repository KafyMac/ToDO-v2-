import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todov2/Controller/controller.dart';
import 'package:todov2/models/models.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  // AddTaskScreen({Key? key, required int index}) : super(key: key);
  int index;
  AddTaskScreen({required this.index});
  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.find();
    // int index = 0;

    String? text;
    text = index == 0 ? "" : nc.notes[index].title;

    TextEditingController textEditingController =
        TextEditingController(text: text);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        foregroundColor: Colors.blueGrey,
        elevation: 0,
        title: index == 0
            ? const Text(
                'Add Tasks Here',
                style: TextStyle(color: Colors.blueGrey),
              )
            : const Text(
                'Update Now',
                style: TextStyle(color: Colors.blueGrey),
              ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 500,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: textEditingController,
                  autocorrect: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      hintText: 'Create a new note!',
                      labelText: 'My Note',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(10))),
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent,
                        ),
                        child: const Text('Cancel')),
                    ElevatedButton(
                        onPressed: () {
                          if (index == 0) {
                            nc.notes
                                .add(Note(title: textEditingController.text));
                          } else {
                            var updatenote = nc.notes[index];
                            updatenote.title = textEditingController.text;
                            nc.notes[index] = updatenote;
                          }
                          Get.back();
                          // var data = nc.notes.where((element) =>
                          //     element.title ==
                          //     textEditingController.text.toString());
                          // if (data.isEmpty) {
                          //   nc.notes
                          //       .add(Note(title: textEditingController.text));
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                        child: index == 0
                            ? const Text('Add')
                            : const Text('Update')),
                  ],
                )
              ]),
        ),
      ),
    ));
  }
}
